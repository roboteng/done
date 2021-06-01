import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("Fail on purpose"),
        ),
      ),
    ),
  ));
}
