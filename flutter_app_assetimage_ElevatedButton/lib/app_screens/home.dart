// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            //width: 200,
            //height:200,
            margin: EdgeInsets.only(top: 30.0),
            color: Colors.deepPurple,
            // ignore: prefer_const_constructors
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    child: Text("Flight1",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30.0,
                            fontFamily: "ZenDots",
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                            //fontStyle:FontStyle.italic
                            ))),
                Expanded(
                    child: Text("Flight to Australia!",
                        textDirection: TextDirection.ltr,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20.0,
                            fontFamily: "ZenDots",
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                            //fontStyle:FontStyle.italic
                            )))
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Text("Flight2",
                        textDirection: TextDirection.ltr,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30.0,
                            fontFamily: "ZenDots",
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                            //fontStyle:FontStyle.italic
                            ))),
                Expanded(
                    child: Text("Flight to China!",
                        textDirection: TextDirection.ltr,
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20.0,
                            fontFamily: "ZenDots",
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                            //fontStyle:FontStyle.italic
                            )))
              ]),
              FlightImageAsset(),
              FlightBookButton(),
            ])));
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flight.png');
    Image image = Image(image: assetImage, width: 350, height: 200);
    return Container(child: image);
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 300.0,
        height: 50.0,
        child: ElevatedButton(
            child: Text('Book now!'),
            onPressed: () {
              bookFlight(context);
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 173, 134, 6),
                //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 30,
                  //fontWeight: FontWeight.bold
                ))));
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
        title: Text("Flight booked successfully!"),
        content: Text("Have a pleasant flight."));
    showDialog(
        context: context,
        builder: ( BuildContext context) {
          return alertDialog;
        });
  }
}
