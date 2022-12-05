// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "./app_screens/home.dart";

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exploring List View",
      home: Scaffold(
          //listview must be in scaffold for scrollabulity as here !
          appBar: AppBar(title: Text("List view here!")),
          //body: getListView1()))); //for small number of items
            body: getListView2())));  //for many items in list view
}

Widget getListView1() {
  // ListVIew is for a small number of list items (too many items can cause memory leaks and must use LongList widget!!
  var listView = ListView(children: <Widget>[
    ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful view!"),
        trailing: Icon(Icons.wb_sunny_sharp),
        onTap: () {
          debugPrint("tapped landscape!");
        }),
    ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("Laptops"),
        subtitle: Text("Beautiful laptop!"),
        trailing: Icon(Icons.wb_sunny_sharp),
        onTap: () {
          debugPrint("tapped laptops!");
        }),
    ListTile(
        leading: Icon(Icons.map),
        title: Text("Maps"),
        subtitle: Text("Beautiful maps!"),
        trailing: Icon(Icons.wb_sunny_sharp),
        onTap: () {
          debugPrint("tapped maps!");
        })
  ]);
  return listView;
}

Widget getListView2() {
  //custom listview using a builder method for very long lists!! ie only the viewable items are loaded in memory behind the scenes.
  var listItems = getListElements();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(leading: Icon(Icons.arrow_right),title: Text(listItems[index]));
  });
  return listView;
}

List<String> getListElements() {
  //retund just the names of the elements of the list!!
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}
