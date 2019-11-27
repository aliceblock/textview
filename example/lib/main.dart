import 'package:flutter/material.dart';
import 'package:textview/textview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _textEditController = TextEditingController();
  TextViewController _textViewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textEditController,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _textViewController.setText(_textEditController.text);
                    },
                    child: Text('Set text'),
                  )
                ],
              ),
            ),
            Container(
              height: 100.0,
              alignment: Alignment.center,
              color: Colors.blueAccent,
              child: SizedBox(
                child: TextView(
                  'Default Text',
                  onCreated: (TextViewController controller) {
                    _textViewController = controller;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
