import 'package:flutter/material.dart';
import 'dart:async';
class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

enum Options{
  A,B,C
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {

  var choosed = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('你选择了$choosed')
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _openSimpleDialog),
    );;
  }

  Future _openSimpleDialog() async{
     final option = await showDialog(context: context,builder: (context){
      return SimpleDialog(
        title: Text('simpleDialog'),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('optionA'),
            onPressed: (){
              Navigator.pop(context,Options.A);
            },
          ),
          SimpleDialogOption(
            child: Text('optionB'),
            onPressed: (){
              Navigator.pop(context,Options.B);
            },
          ),
          SimpleDialogOption(
            child: Text('optionC'),
            onPressed: (){
              Navigator.pop(context,Options.C);
            },
          ),
        ],
      );
    });
     switch(option){
       case Options.A:
         setState(() {
           choosed = 'A';
         });
        break;
       case Options.B:
         setState(() {
           choosed = 'B';
         });
        break;
       case Options.C:
         setState(() {
           choosed = 'C';
         });
        break;
     }
  }
}
