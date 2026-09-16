import 'package:flutter/material.dart';

void main()=>runApp(const GestureDetectorExample());

class GestureDetectorExample extends StatelessWidget{
  const GestureDetectorExample({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Gesture Detector App",
      home: Scaffold(
        appBar: AppBar(
          title:Text("Gesture Detector")
        ), // AppBar
        body:Center(child: GestureWidget(),)
      ) // Scaffold
    ); // MaterialApp
  }
}

class GestureWidget extends StatefulWidget{
  const GestureWidget({super.key});
  @override
  State<GestureWidget> createState() => _GestureWidgetState();
}

class _GestureWidgetState extends State<GestureWidget>{
  Color _color = Colors.blue;
  String _eventText = "You haven't preformed any action";
  void _onTap(){
    setState(() {
      _color= Colors.red;
      _eventText="box is red as you have tapped the box.";
    });
  }
  void _onDoubleTap(){
    setState((){
      _color= Colors.yellow;
      _eventText = "box is yellow as you have double tapped the box.";
    });
  }
  void _onLongPress(){
    setState((){
      _color= Colors.green;
      _eventText = "box is green as you have long pressed the box.";
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _onTap,
          onDoubleTap: _onDoubleTap,
          onLongPress: _onLongPress,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ), // BoxDecoration
          ), // Container
        ), // GestureDetector
        Text(
          "$_eventText",
          style: TextStyle(color: _color),
        ) // Text
      ],
    ); // Column
  }
}