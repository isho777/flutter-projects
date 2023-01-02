// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 208, 211, 41), //backcolor
        child: Center(
            child: Text("Hello Flutter2..",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Color.fromARGB(255, 55, 245, 134),
                    fontSize: 40.0
                )
            )
        )
    );
  }
}
