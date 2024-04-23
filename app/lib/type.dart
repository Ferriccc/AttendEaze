import 'package:app/colors.dart';
import 'package:app/login.dart';
import 'package:flutter/material.dart';

class Typepage extends StatefulWidget {
  const Typepage({Key? key}) : super(key: key);

  @override
  State<Typepage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Typepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child:
                  const Image(image: AssetImage('assets/images/qr image.jpg'))),
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: const Text(
              "Welcome!",
              textScaleFactor: 2.2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "---- Select user type ----",
              textScaleFactor: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 30),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Loginpage_st()),
                  );
                },
                child: const Text(
                  'Student',
                  textScaleFactor: 1.6,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 15),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage_tt()));
                },
                child: const Text(
                  'Tutor',
                  textScaleFactor: 1.6,
                )),
          )
        ],
      ),
    );
  }
}
