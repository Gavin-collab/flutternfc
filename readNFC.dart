import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'resources.dart';

class readPage extends StatefulWidget {
  readPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _readPage createState() => _readPage();
}

class _readPage extends State<readPage> {
  static String mainMessage = "No message yet";

  StreamSubscription<NDEFMessage> _stream;

  void _startScanning() {
    setState(() {
      _stream = NFC.readNDEF().listen((NDEFMessage message) {
        setState(() {
          print("ok");
          mainMessage = message.payload.toString();
        });
      });
    });
  }

  void _stopScanning() {
    _stream?.cancel();
    setState(() {
      _stream = null;
    });
  }

  void _toggleScan() {
    if (_stream == null) {
      _startScanning();
    } else {
      _stopScanning();
    }
  }

  @override
  Widget build(BuildContext context) {
    double mediaH = MediaQuery.of(context).size.height;
    double mediaW = MediaQuery.of(context).size.width;
    double mediaTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: mediaTop / 2),
              child: textTitle((_stream != null).toString(), mediaTop / 2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: mediaTop / 2),
              child: textTitle(mainMessage, mediaTop / 2),
            ),
            pageButton(mediaH / 10, mediaW * 0.35, _toggleScan,
                (_stream != null) ? "stop" : "start"),
          ],
        ),
      ),
    );
  }
}
