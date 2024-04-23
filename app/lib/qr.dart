import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'all api related stuff.dart';
import 'config.dart';

class qrpage extends StatefulWidget {
  qrpage({key, required this.code}) : super(key: key);
  final String code;

  @override
  State<qrpage> createState() => _qrpageState();
}

class _qrpageState extends State<qrpage> {
  // final WebSocketChannel chan = IOWebSocketChannel.connect('$ws/secure');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: null,
            builder: (context, snapshot1) {
              return FutureBuilder(
                future: name_sven(),
                builder: (context, snapshot) {
                  // chan.sink.add(json.encode(<String, String>{"data": "save"}));
                  // print(snapshot1.data.toString());
                  var l = snapshot.data?.toList() ?? ["", ""];
                  var namee = l[1];
                  var enne = l[0];
                  print("${widget.code} $enne $namee");
                  return QrImage(
                    data:
                        ('{"classcode":"${widget.code}","en":"$enne","name":"$namee"}'),
                    version: QrVersions.auto,
                    size: 320,
                  );
                },
              );
            }),
      ),
    );
  }

  // @override
  // void dispose() {
  //   chan.sink.close();
  //   super.dispose();
  // }
}
