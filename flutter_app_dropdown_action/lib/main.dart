import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Stateful App Example",
    home: FavoriteCity(),
  ));
}

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = "";
  var _currencies = {"dollars","pounds","rupees", "other"};
  var _currencySelected = "dollars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateful App Example")),
      body: Container(
              margin: EdgeInsets.all(20.0),
              child:Column( //will use 1 column
                      children: <Widget> [ // array of widgets in a column
                                  TextField(onSubmitted: (String userInput){
                                            //onSubmitted: set state  after enter
                                            //OnChanged: set state while typing
                                                            setState( (){
                                                              nameCity = userInput; 
                                                              debugPrint("");
                                                            }     
                                                            );
                                                          },
                                            decoration: InputDecoration(//when done
                                                enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 233, 175, 68)),                                
                                              ),
                                            focusedBorder:OutlineInputBorder(//<-- when typing
                                                        borderSide: const BorderSide(color: Color.fromARGB(255, 55, 221, 63), width: 2.0),
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                            ),
                                                                                  
                                  ),
                                  DropdownButton<String>(
                                    items: _currencies.map( ( FavoriteCity
){
                                                            return DropdownMenuItem< String >(
                                                                     value: dropDownStringItem,
                                                                     child: Text(dropDownStringItem)
                                                                   );
                                                          }
                                    ).toList(),
                                    onChanged: ( newValueSelected){                                                
                                                  dropDownCurrencyChanged_doStuff(newValueSelected.toString());
                                               },

                                    value: _currencySelected
                                  ),
                                  Padding(//to have textfield inside, too allow space 
                                           //around Text object
                                    padding:EdgeInsets.all(30.0),
                                    child: Text("Your chosen city is $nameCity", //<-Text      style:TextStyle(fontSize:20.0,))
                                  )),
                                 

                                ]
                    )
            )
    );
  }

void dropDownCurrencyChanged_doStuff(String sel){
  setState( (){
                _currencySelected = sel.toString(); //_currencySelected is class variable
                debugPrint("$_currencySelected was selected");
              });
}

}
