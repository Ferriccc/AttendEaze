import 'dart:convert';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:google_sign_in/google_sign_in.dart';

void stlogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('type');
  prefs.remove('en');
  prefs.remove('sven');
  await googlesigninapi.logout();
}

void classcreate(String classname, String classcode, String room) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('ist', '1');

  http.post(Uri.parse(Insert_classroute),
      body: jsonEncode(<String, String>{
        "classname": classname,
        "classcode": classcode,
        "room": room
      }));

  prefs.setString('classname', classname);
}

void ttlogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('type');
  prefs.remove('en');
  prefs.remove('sven');

  await googlesigninapi.logout();
}

void savecsv(var l) async {
  String csv = const ListToCsvConverter().convert(l);
  //print(csv);

  final contents = csv;
  final Stream<List<int>> mediaStream =
      Future.value(contents.codeUnits).asStream().asBroadcastStream();
  var media = drive.Media(mediaStream, contents.length);

  var driveFile = drive.File();
  final timestamp = DateFormat("yyyy-MM-dd-hhmmss").format(DateTime.now());
  driveFile.name = "$timestamp.csv";
  driveFile.modifiedTime = DateTime.now().toUtc();

  var d = await getdriveapi();
  final dd = await _getFolderId(d!);
  driveFile.parents = [dd!];

  await d.files.create(driveFile, uploadMedia: media);
}

Future<int> loginstate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('en') == null) {
    return 0;
  } else if (prefs.getString('type') == 'student' &&
      prefs.getString('en') != null) {
    return 1;
  } else if (prefs.getString('type') == 'tutor' &&
      prefs.getString('en') != null) {
    return 2;
  } else {
    return -1;
  }
}

Future<String> name() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('en')!;
}

Future<List<String>> name_sven() async {
  List<String> l = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  l.add(prefs.getString('sven')!);
  l.add(prefs.getString('en')!);

  return l;
}

Future<List<List>> getclasses() async {
  var response = await http.get(Uri.parse(Get_classesroute));
  var decoded_response = await json.decode(response.body);

  List better_dec_res = await decoded_response['data'];

  List<List> data = [];

  for (var i = 0; i < better_dec_res.length; i++) {
    data.add([
      better_dec_res[i]['classname'],
      better_dec_res[i]['classcode'],
      better_dec_res[i]['room']
    ]);
  }
  return data;
}

Future<String?> _getFolderId(drive.DriveApi driveApi) async {
  const mimeType = "application/vnd.google-apps.folder";
  String folderName = "AttendEaze";

  try {
    final found = await driveApi.files.list(
      q: "mimeType = '$mimeType' and name = '$folderName'",
      $fields: "files(id, name)",
    );
    final files = found.files;
    if (files == null) {
      return null;
    }

    // The folder already exists
    if (files.isNotEmpty) {
      return files.first.id;
    }

    // Create a folder
    var folder = drive.File();
    folder.name = folderName;
    folder.mimeType = mimeType;
    final folderCreation = await driveApi.files.create(folder);

    return folderCreation.id;
  } catch (e) {
    return null;
  }
}

Future loginstudent() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final user = await googlesigninapi.login();

  String email = user!.email;

  var res = await http.post(Uri.parse(Loginroute),
      body: jsonEncode(<String, String>{"en": email}));

  var resdec = json.decode(res.body);

  if (resdec["Name"] != null) {
    prefs.setString('type', 'student');
    prefs.setString('en', resdec["Name"]);
    prefs.setString('sven', resdec["EN"]);

    return resdec["Name"];
  } else {
    await googlesigninapi.logout();
    return "false";
  }
}

Future loginteach() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final user = await googlesigninapi.login();

  String email = user!.email;

  var res = await http.post(Uri.parse(Authroute),
      body: jsonEncode(<String, String>{"email": email}));

  var resdec = json.decode(res.body);

  if (resdec["out"] != "false") {
    prefs.setString('type', 'tutor');
    prefs.setString('en', user.email);
    prefs.setString('sven', user.displayName!);

    return user.displayName!;
  } else {
    await googlesigninapi.logout();

    return "false";
  }
}

Future<bool> getst() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('ist') == null || prefs.getString('ist') == '0') {
    return false;
  } else {
    return true;
  }
}

Future<List<String>> name_sven1() async {
  List<String> l = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  l.add(prefs.getString('en')?.toString() ?? "");
  l.add(prefs.getString('sven')?.toString() ?? "");

  return l;
}

class googlesigninapi {
  static final _googlesignin = GoogleSignIn.standard(scopes: [
    'https://www.googleapis.com/auth/drive',
    drive.DriveApi.driveFileScope,
  ]);

  static Future<GoogleSignInAccount?> login() => _googlesignin.signIn();

  static Future logout() => _googlesignin.disconnect();
}

Future<drive.DriveApi?> getdriveapi() async {
  final googleuser = await googlesigninapi.login();
  final headers = await googleuser?.authHeaders;
  final client = GoogleAuthClient(headers!);
  final driveApi = drive.DriveApi(client);
  return driveApi;
}

class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final _client = http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _client.send(request);
  }
}
