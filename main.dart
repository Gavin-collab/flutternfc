import 'package:flutter/material.dart';
import 'package:payment/readNFC.dart';
import 'package:payment/writeNFC.dart';
import 'resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void goWrite() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => writePage()));
  }

  void goRead() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => readPage()));
  }

  @override
  Widget build(BuildContext context) {
    double mediaH = MediaQuery.of(context).size.height;
    double mediaW = MediaQuery.of(context).size.width;
    double mediaTop = MediaQuery.of(context).padding.top;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pageButton(mediaH/10, mediaW*0.35, goRead,"Read NFC"),
              pageButton(mediaH/10, mediaW*0.35, goWrite,"Write NFC")
            ],
          ),
        ));
  }
}
