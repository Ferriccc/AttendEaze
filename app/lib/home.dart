import 'package:app/all%20api%20related%20stuff.dart';
import 'package:app/colors.dart';
import 'package:app/qr.dart';
import 'package:app/type.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage_st extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage_st> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 35),
                color: pink,
                child: TabBar(
                  labelColor: white,
                  enableFeedback: true,
                  tabs: const [
                    Tab(
                        icon: Icon(
                      Icons.class_,
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
                  child: TabBarView(children: [
                Column(
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
                        'Ongoing classes',
                        textScaleFactor: 2,
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FutureExample(),
                    ),
                  ],
                ),
                FutureExample3()
              ]))
            ])));
  }
}

class FutureExample extends StatefulWidget {
  @override
  _futureexam createState() => _futureexam();
}

class _futureexam extends State<FutureExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<List>>(
          future: getclasses(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : RefreshIndicator(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: ((context, index) {
                        String room = snapshot.data![index][2];
                        return Container(
                          padding: const EdgeInsets.only(
                              bottom: 10, right: 10, left: 10),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            trailing: IconButton(
                              icon: const Icon(Icons.qr_code_2),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => qrpage(
                                        code: snapshot.data![index][1],
                                      ),
                                    ));
                              },
                            ),
                            tileColor: tilecolor,
                            title: Text(snapshot.data![index][0]),
                            subtitle: Text("Room : $room "),
                          ),
                        );
                      }),
                    ),
                    onRefresh: () {
                      return Future(() {
                        setState(() {});
                      });
                    },
                  );
          },
        ));
  }
}

class FutureExample3 extends StatefulWidget {
  @override
  _futureexam3 createState() => _futureexam3();
}

class _futureexam3 extends State<FutureExample3> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: name_sven(),
        builder: (context, snapshot) {
          var l = snapshot.data?.toList() ?? ["", ""];
          var nameee = l[1];
          var eneee = l[0];
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
            Text(nameee,
                style: TextStyle(color: backblack), textScaleFactor: 1.7),
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
                stlogout();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Typepage()),
                );
              },
            )
          ]);
        });
  }
}
