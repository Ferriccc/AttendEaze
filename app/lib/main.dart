import 'package:app/colors.dart';
import 'package:app/home.dart';
import 'package:app/home2.dart';
import 'package:app/type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all api related stuff.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  if (await loginstate() == 0) {
    runApp(const MyAPP());
  } else if (await loginstate() == 1) {
    runApp(const MYshome());
  } else if (await loginstate() == 2) {
    runApp(const MYthome());
  } else if (await loginstate() == -1) {}
}

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                surface: pink,
                onSurface: white,
                error: red,
                onError: white,
                primary: pink,
                secondary: accpink,
                onBackground: backblack,
                background: white,
                onPrimary: white,
                onSecondary: white),
            snackBarTheme: SnackBarThemeData(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            scaffoldBackgroundColor: white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: logins),
            ),
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        home: const Typepage());
  }
}

class MYshome extends StatelessWidget {
  const MYshome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              surface: pink,
              onSurface: white,
              error: red,
              onError: white,
              primary: pink,
              secondary: accpink,
              onBackground: backblack,
              background: white,
              onPrimary: white,
              onSecondary: white),
          snackBarTheme: SnackBarThemeData(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          scaffoldBackgroundColor: white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: logins),
          ),
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: HomePage_st(),
    );
  }
}

class MYthome extends StatelessWidget {
  const MYthome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme(
              primaryContainer: pink,
              brightness: Brightness.light,
              surface: pink,
              onSurface: white,
              error: red,
              onError: white,
              primary: pink,
              secondary: accpink,
              onBackground: pink,
              background: white,
              onPrimary: white,
              onSecondary: white),
          snackBarTheme: SnackBarThemeData(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          scaffoldBackgroundColor: white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: logins),
          ),
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: HomePage_tt(),
    );
  }
}
