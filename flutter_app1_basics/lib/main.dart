// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "./app_screens/first_screen.dart";
import "./app_screens/second_screen.dart";

void main() => runApp(new MyFlutterApp());
//use => fat arrow  if only 1 method is called in Main()

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My flutter app",
        home: Scaffold(
            appBar: AppBar(title: Text("My first app screen")),
            body: FirstScreen()          
        )
     );
  }


}
