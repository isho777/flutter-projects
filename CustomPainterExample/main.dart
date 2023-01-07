import 'package:flutter/material.dart';
//import 'CustomPainterView.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {  
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Paint example ',
      //theme: ThemeData(  //use theme if needed
      //     brightness: Brightness.dark,
      //     primaryColor: Colors.indigo,
      //     accentColor: Colors.indigoAccent
      //    ),      
      home: _CustomPainterView()  // _is implemented in this file
                                  //first return the StatefulWidget  _CustomPainterView()                             
    );
  }
}


class _CustomPainterView extends StatefulWidget{ //must be a stateful widget
  @override
  State<StatefulWidget> createState() {
   return _CustomViewState();   //now  return the State widget
  }
}

class _CustomViewState extends State<_CustomPainterView>{//State references the Stateful widget from which it was called
  Map<String, Object> painterData = {'screenMessage':'not yet swiped', 'center_x': 300.0, 
                                      'center_y': 300.0,'radius': 100.0, 'pointerDistFromCircleCenter':0.0,  
                                        'h_dist_from_center':0.0, 'v_dist_from_center':0.0};
  //var centerX = 0;
  //var centerY = 0;
  //var center = Offset(0,0);
  //var radius = 0;
  
  //all the needed parameters for the instance of  CustomPainter class must be defined here in the State Class. they will be passed by setState() method to the  CustomPainter which will provides the actual canvas

  @override
  Widget build(BuildContext context) {
    return  Scaffold(             
              appBar: AppBar( title: Text("Custom Painter Example") ) ,
                body: Container(
                        width: MediaQuery.of(context).size.width,//get width from device
                        height: MediaQuery.of(context).size.width*2, //i use the the custom width from half of the height                                                                                      
                        // ignore: sort_child_properties_last
                        child:  GestureDetector( //to allow screen swipe or drag    
                                    child: CustomPaint(//CustomPaint() is just a container for actual painter. 
                                                       //note the spelling 
                                            painter: _CustomPainterExample(painterData, context) 
                                                      //return CustomPainter() 
                                                      //supply constructor data
                                           ),  
                                    //onVerticalDragUpdate: (details) {
                                      onTapDown:( TapDownDetails  details){//calculate once on tap the following
                                          debugPrint("tapped down,...");
                                          double pointerDistFromCircleCenter = getDistFromCircleCenter(painterData,details);
                                          painterData.update('pointerDistFromCircleCenter',(value)=> 
                                            pointerDistFromCircleCenter);
                                          
                                         double h_dist_from_center = (details.localPosition.dx - double.parse(painterData['center_x'].toString()));
                                          painterData.update('h_dist_from_center',(value)=> 
                                            h_dist_from_center);

                                         double v_dist_from_center = (details.localPosition.dy - double.parse(painterData['center_y'].toString()));
                                          painterData.update('v_dist_from_center',(value)=> 
                                            v_dist_from_center);
                                      }, 

                                      onPanUpdate:(details) {
                                      int sensitivity = 1;// = 1 every pixel swiped will be detected by below code
                                      setState( (){    
                                            double d = double.parse(painterData['pointerDistFromCircleCenter'].toString());
                                            double r = double.parse(painterData['radius'].toString());
                                            double h_dist_from_center = double.parse(painterData['h_dist_from_center'].toString());
                                            double v_dist_from_center = double.parse(painterData['v_dist_from_center'].toString());
                                            //debugPrint("from center.. h..$h_dist_from_center ..v $v_dist_from_center");
                                          
                                           if ( d < r) {//tapped within circle radiuds from center                                                                         
                                            double x = double.parse(painterData['center_x'].toString()); //current posx
                                            double y = double.parse(painterData['center_y'].toString()); //current posy                                                                                                   
                                            painterData.update('center_x',(value) => details.localPosition.dx-h_dist_from_center);    
                                             painterData.update('center_y',(value)=> 
                                            details.localPosition.dy-v_dist_from_center);
                                                

                                           //debugPrint("center ... ${double.parse(painterData['center_x'].toString())} ... ${double.parse(painterData['center_y'].toString())}" );      
                                           }                  
                                          if  (details.delta.dy > sensitivity) {                                              
                                                debugPrint("swipe down");   //print to the debug console                                           
                                                painterData['screenMessage'] = "swipe down";
                                                                                                 
                                                //int y  = int.parse(painterData['center_y'].toString());
                                                //painterData.update('center_y', (value) => ++y);
                                                //this change only the key-value that needs to be changed in the key-value pairs, then repaint.
                                                // painterData map will change but inside setState() will cause other effect                                                
                                                //setState  calls CustomPainter consctructor before repaint
                                                //setState force a repaint in  CustomPainter
                                          } 
                                          if(details.delta.dy < -sensitivity){                                           
                                              debugPrint("swipe up");  
                                                painterData['screenMessage'] = "swipe up";                                                 
                                            
                                          }

                                                                             
                                           if  (details.delta.dx > sensitivity) {                                             
                                                debugPrint("swipe right");
                                                  painterData['screenMessage'] = "swipe right";
                                                 
                                          } 
                                          if(details.delta.dx < -sensitivity){
                                              
                                              debugPrint("swipe left");  
                                              painterData['screenMessage'] = "swipe left";      
                                                                  
                                          }  
                                                                             
                                        }
                                      );
                                    },
                                    /*onHorizontalDragUpdate: (details) {
                                      int sensitivity = 1;
                                      setState( (){      
                                           painterData.update('center_x', (value) => details.localPosition.dx);                                      
                                           if  (details.delta.dx > sensitivity) {                                             
                                                debugPrint("swipe right");
                                                  painterData['screenMessage'] = "swipe right";
                                                 
                                          } 
                                          if(details.delta.dx < -sensitivity){
                                              
                                              debugPrint("swipe left");  
                                              painterData['screenMessage'] = "swipe left";      
                                                                  
                                          }                                    
                                        }
                                      );
                                    },    */
                                 
                                                                    
                                ),  
  
                                //color: Color.fromARGB(255, 50, 57, 126)
                        // ignore: prefer_const_constructors
                        color: Color.fromARGB(255, 1, 108, 141),
                        
                      ),
            );
  }

 double  getDistFromCircleCenter(Map<String,Object> painter_data, TapDownDetails  details){
    double x  = double.parse(painterData['center_x'].toString()); //circle data
    double y  = double.parse(painterData['center_y'].toString());  //cirlcle data

    double a  = details.localPosition.dx; //tap location on screen
    double b  = details.localPosition.dy; //tap location on screen
    double radius = double.parse(painterData['radius'].toString()); //radius of circle
    num d = sqrt(pow( (a - x),2) + pow( (b - y),2));//distance netween 2 points. num <type> can be assigned to either integer or double as final store
     //debugPrint("dist is $d");
    //if (d < radius) return true;
    return d.toDouble();
}


}

class _CustomPainterExample extends CustomPainter {

  Map<String, Object> painterData = new Map<String, Object>();

  _CustomPainterExample(Map<String, Object> pdata, BuildContext context){
     painterData = pdata;         
  }

  @override
  void paint(Canvas canvas, Size size) {
    //var centerX = size.width/2;
    //var centerY = size.height/2;
    //var center = Offset(centerX,centerY);
    //var radius = min(centerX,centerY);
    var fillBrush = Paint()
        // ignore: prefer_const_constructors
        ..color = Color.fromARGB(255, 202, 122, 29);
    canvas.drawCircle( Offset(double.parse(painterData['center_x'].toString()), double.parse(painterData['center_y'].toString())), double.parse(painterData['radius'].toString()), fillBrush );
      
  var textPainter = TextPainter(   
                        text: TextSpan(
                               text:  painterData['screenMessage'].toString(),
                               style: TextStyle(color: Color.fromARGB(255, 245, 242, 242),fontSize: 30,),
                              ),
                        textDirection: TextDirection.ltr,                        
                      );
  textPainter.layout(minWidth: 0, maxWidth: size.width);//<<< needed method
  textPainter.paint(canvas, Offset(5.0, (90/100)*size.height));
  } //customPainter

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;  //always repaint if setState() is called from the State()  class
  }

}