import 'dart:ui';

import 'package:app/colors.dart';
import 'package:app/home.dart';
import 'package:app/home2.dart';
import 'package:flutter/material.dart';
import 'all api related stuff.dart';

//student login

class Loginpage_st extends StatefulWidget {
  const Loginpage_st({Key? key}) : super(key: key);

  @override
  State<Loginpage_st> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage_st> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: const Image(
                    image: AssetImage('assets/images/student.jpg'))),
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                "Student Login",
                textScaleFactor: 2.2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: pink,
                ),
              ),
            ),
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: accpinkc,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.only(top: 0, left: 30, right: 30),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: pink,
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Text(
                        "Login with university email id",
                        style: TextStyle(color: pink),
                        textScaleFactor: 1.1,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 80),
                child: ElevatedButton(
                    onPressed: () async {
                      var c = await loginstudent();
                      if (c != "false") {
                        snackvalid(c, context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage_st()),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackinvalid);
                      }
                    },
                    child: Text("Sign in with Google",
                        style: TextStyle(color: white), textScaleFactor: 1.4))),
          ],
        ),
      ),
    );
  }
}

//tutor login

class Loginpage_tt extends StatefulWidget {
  const Loginpage_tt({Key? key}) : super(key: key);

  @override
  State<Loginpage_tt> createState() => _LoginpageState_tt();
}

class _LoginpageState_tt extends State<Loginpage_tt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child:
                    const Image(image: AssetImage('assets/images/tutor.jpg'))),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                "Tutor Login",
                textScaleFactor: 2.2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: pink,
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: accpinkc,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                margin: const EdgeInsets.only(top: 0, left: 30, right: 30),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        color: pink,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      Expanded(
                        child: Text(
                          "All attendence sheets for your classes will be uploaded to this google drive account!",
                          style: TextStyle(color: pink),
                          textScaleFactor: 1,
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 80, right: 80, top: 60),
                child: ElevatedButton(
                    onPressed: () async {
                      String c = await loginteach();
                      if (c != "false") {
                        snackvalid(c, context);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage_tt()),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackinvalid);
                      }
                    },
                    child: Text("Sign in with google",
                        style: TextStyle(color: white), textScaleFactor: 1.4))),
          ],
        ),
      ),
    );
  }
}

final snackinvalid = SnackBar(
  margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
  content: Row(
    children: [
      Icon(
        Icons.block,
        color: pink,
      ),
      const Padding(padding: EdgeInsets.only(right: 10)),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sigin failed!",
              style: TextStyle(color: pink, fontWeight: FontWeight.bold),
              textScaleFactor: 1.2,
              textAlign: TextAlign.left,
            ),
            const Padding(padding: EdgeInsets.only(bottom: 3)),
            Text(
              "Invalid credentials...",
              style: TextStyle(color: pink),
              textScaleFactor: 1.0,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      )
    ],
  ),
);

snackvalid(String nametoshow, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
    content: Row(
      children: [
        Icon(
          Icons.check,
          color: pink,
        ),
        const Padding(padding: EdgeInsets.only(right: 10)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome!",
                style: TextStyle(color: pink, fontWeight: FontWeight.bold),
                textScaleFactor: 1.2,
                textAlign: TextAlign.left,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 3)),
              Text(
                "Signed in as $nametoshow",
                style: TextStyle(color: pink),
                textScaleFactor: 1.0,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      ],
    ),
  ));
}
