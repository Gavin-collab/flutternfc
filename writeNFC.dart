import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'resources.dart';
import 'dart:io';

class writePage extends StatefulWidget {
  writePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _writePage createState() => _writePage();
}

class _writePage extends State<writePage> {

  bool _hasClosedWriteDialog = false;

  StreamSubscription<NDEFMessage> _stream;

  

  void _write(BuildContext context) async {
    List<NDEFRecord> records = [
      NDEFRecord.type("text/plain", "payload")
    ];
    NDEFMessage message = NDEFMessage.withRecords(records);

    // Show dialog on Android (iOS has it's own one)
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Scan the tag you want to write to"),
          actions: <Widget>[
            FlatButton(
              child: const Text("Cancel"),
              onPressed: () {
                _hasClosedWriteDialog = true;
                _stream?.cancel();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }

    // Write to the first tag scanned
    await NFC.writeNDEF(message).first;
    if (!_hasClosedWriteDialog) {
      Navigator.pop(context);
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
            
            pageButton(mediaH / 10, mediaW * 0.35, () {
              _write(context);
            }, "Write"),
          ],
        ),
      ),
    );
  }
}
