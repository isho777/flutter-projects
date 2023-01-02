// ignore_for_file: prefer_const_constructors

import 'dart:math';

import "package:flutter/material.dart";

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 64, 255, 89), //backcolor
        child: Center(
            child: Text(
                generateRandomNumber(),
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white, fontSize: 40.0))));
  }

  String generateRandomNumber() {
    return Random().nextInt(100000).toString();
  }
}
