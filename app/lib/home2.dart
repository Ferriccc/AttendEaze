import 'package:app/colors.dart';
import 'package:app/config.dart';
import 'package:app/type.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'all api related stuff.dart';

class HomePage_tt extends StatefulWidget {
  @override
  _HomePageStatett createState() => _HomePageStatett();
}

class _HomePageStatett extends State<HomePage_tt> {
  @override
  Widget build(context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 35),
                  color: pink,
                  child: TabBar(
                    labelColor: white,
                    enableFeedback: true,
                    tabs: const [
                      Tab(
                          icon: Icon(
                        Icons.create,
                        size: 30,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.person,
                        size: 30,
                      ))
                    ],
                    indicatorColor: Colors.transparent,
                  ),
                ),
                Expanded(
                    child: TabBarView(
                        children: [FutureExample2(), FutureExample1()]))
              ],
            )));
  }
}

class FutureExample1 extends StatefulWidget {
  @override
  _future1 createState() => _future1();
}

class _future1 extends State<FutureExample1> {
  @override
  Widget build(context) {
    return FutureBuilder<List<String>>(
        future: name_sven1(),
        builder: (context, snapshot) {
          var l = snapshot.data?.toList() ?? ["", ""];
          var eneee = l[0];
          var neeee = l[1];
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: pink,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                padding: const EdgeInsets.only(top: 30, bottom: 60),
                alignment: Alignment.center,
                child: Text(
                  'Profile',
                  textScaleFactor: 2,
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pback,
                        ),
                        child: const Image(
                          width: 60,
                          height: 60,
                          image: AssetImage('assets/images/user.png'),
                        )),
                  ],
                ),
              )
            ]),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(neeee,
                style: TextStyle(color: backblack, fontWeight: FontWeight.bold),
                textScaleFactor: 1.3),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(eneee,
                style: TextStyle(color: backblack), textScaleFactor: 1.0),
            const Padding(padding: EdgeInsets.only(top: 100)),
            ElevatedButton(
              child: Text(
                'Logout',
                style: TextStyle(color: white),
                textScaleFactor: 1.4,
              ),
              onPressed: () {
                ttlogout();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Typepage()),
                );
              },
            )
          ]);
        });
  }
}

class FutureExample2 extends StatefulWidget {
  @override
  _future2 createState() => _future2();
}

class _future2 extends State<FutureExample2> {
  @override
  Widget build(context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController codecontroller = TextEditingController();
    TextEditingController roomcontroller = TextEditingController();
    List namee = [];
    return SingleChildScrollView(
        child: FutureBuilder(
            future: getst(),
            builder: (context, snapshot) {
              return snapshot.data == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Container(
                            decoration: BoxDecoration(
                                color: pink,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            padding: const EdgeInsets.only(top: 30, bottom: 60),
                            alignment: Alignment.center,
                            child: Text(
                              'Create Class',
                              textScaleFactor: 2,
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 75)),
                          Container(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextField(
                              controller: namecontroller,
                              decoration: InputDecoration(
                                fillColor: tilecolor,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40)),
                                hintStyle: TextStyle(color: grey),
                                hintText: 'Class name',
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          Container(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextField(
                              controller: codecontroller,
                              decoration: InputDecoration(
                                fillColor: tilecolor,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40)),
                                hintStyle: TextStyle(color: grey),
                                hintText: 'Class code',
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          Container(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextField(
                              controller: roomcontroller,
                              decoration: InputDecoration(
                                fillColor: tilecolor,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40)),
                                hintStyle: TextStyle(color: grey),
                                hintText: 'Room number',
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 45)),
                          ElevatedButton(
                              onPressed: () async {
                                classcreate(namecontroller.text,
                                    codecontroller.text, roomcontroller.text);
                                setState(() {});
                              },
                              child: Text(
                                "Start Class",
                                style: TextStyle(color: white),
                                textScaleFactor: 1.4,
                              ))
                        ])
                  : Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: pink,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                        padding: const EdgeInsets.only(top: 30, bottom: 60),
                        alignment: Alignment.center,
                        child: Text(
                          'Manage Class',
                          textScaleFactor: 2,
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 70)),
                      Container(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 100, right: 100),
                          child: const Image(
                              image: AssetImage('assets/images/takeatt.png'))),
                      const Padding(padding: EdgeInsets.only(bottom: 30)),
                      Container(
                          decoration: BoxDecoration(
                              color: accpinkc,
                              backgroundBlendMode: BlendMode.darken,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          margin: const EdgeInsets.only(
                              top: 0, left: 30, right: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: pink,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(right: 10)),
                                Expanded(
                                  child: Text(
                                    "Click End class to save attendence sheet to your google drive!",
                                    style: TextStyle(color: pink),
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              ],
                            ),
                          )),
                      const Padding(padding: EdgeInsets.only(bottom: 50)),
                      ElevatedButton(
                          child: Text(
                            "Take Attendence",
                            style: TextStyle(color: white),
                            textScaleFactor: 1.4,
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            var _cl = prefs.getString('classname');
                            final List scannedCodes = [];

                            final qrKey = GlobalKey(debugLabel: 'QR');

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  body: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: QRView(
                                          key: qrKey,
                                          onQRViewCreated: (controller) async {
                                            controller = controller;

                                            while (true) {
                                              await for (final scanData
                                                  in controller
                                                      .scannedDataStream) {
                                                var m =
                                                    json.decode(scanData.code!);

                                                var en = m['en'];
                                                var codee = m['classcode'];

                                                // if (m['locked'] != 'false') {
                                                //   if (scannedCodes1
                                                //       .contains(en)) {
                                                //   } else {

                                                //   scannedCodes1.add(en);

                                                //   }
                                                // } else {}
                                                if (scannedCodes.contains(en)) {
                                                } else {
                                                  var a = await http.patch(
                                                      Uri.parse(
                                                          Insert_classroute),
                                                      body: json.encode(<String,
                                                          String>{
                                                        "classname": "$_cl",
                                                        "classcode": "$codee",
                                                        "en": "$en"
                                                      }));

                                                  if (json.decode(
                                                          a.body)["data"] ==
                                                      "true") {
                                                    scannedCodes.add(en);
                                                    var tempp = m['name'];
                                                    namee.add(tempp);

                                                    snackscan(
                                                        tempp, en, context);
                                                  }
                                                }
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: accpinkcv2,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15))),
                                          margin: const EdgeInsets.only(
                                              top: 0,
                                              left: 20,
                                              right: 20,
                                              bottom: 30),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.info_outline_rounded,
                                                  color: white,
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10)),
                                                Expanded(
                                                  child: Text(
                                                    "Scan QR codes in batch, attendence will be marked and synced automatically!",
                                                    style:
                                                        TextStyle(color: white),
                                                    textScaleFactor: 1,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      const Padding(padding: EdgeInsets.only(bottom: 15)),
                      ElevatedButton(
                        child: Text(
                          "End class",
                          style: TextStyle(color: white),
                          textScaleFactor: 1.4,
                        ),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var classname = prefs.getString('classname');
                          var data = await http.get(Uri.parse(
                              '$Insert_classroute?classname=$classname'));
                          var data_decoded = json.decode(data.body);

                          List<List<String>> listOfLists = [];

                          List<dynamic> t = data_decoded['data'][0];

                          for (int i = 0; i < (t.length.toInt()); i++) {
                            listOfLists.add([namee[i], t[i]]);
                          }

                          savecsv(listOfLists);

                          prefs.remove('classname');
                          prefs.remove('classcode');
                          prefs.remove('enn');
                          prefs.setString('ist', '0');

                          await http.delete(Uri.parse(Insert_classroute),
                              body: jsonEncode(
                                  <String, String>{"classname": classname!}));

                          namee = [];
                          setState(() {});
                        },
                      ),
                    ]);
            }));
  }
}

snackscan(String tempp, String en, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
    backgroundColor: accpinkcv2,
    content: Row(
      children: [
        Icon(
          Icons.qr_code_2_rounded,
          color: white,
        ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        Expanded(
          child: Text(
            "$tempp\n$en",
            style: TextStyle(color: white),
            textScaleFactor: 1,
            textAlign: TextAlign.left,
          ),
        )
      ],
    ),
  ));
}
