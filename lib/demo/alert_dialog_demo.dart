import 'package:flutter/material.dart';
import 'dart:async';
class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

enum Option{
  OK,CANCEL
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {

  var selected = '';

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
            Text("选择了$selected"),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: _showAlertDialog,
                  child: Text('弹窗吧'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _showAlertDialog() async{
    final option = await showDialog(
      context: context,
      //点击周围不消失
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('你确定吗'),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: (){
               Navigator.pop(context,Option.CANCEL);
              },
            ),
            FlatButton(
              child: Text('确定'),
              onPressed: (){
                Navigator.pop(context,Option.OK);
              },
            ),
          ],
        );
      }
    );
    switch(option){
      case Option.CANCEL:
        setState(() {
          selected = 'cancel';
        });
        break;
      case Option.OK:
        setState(() {
          selected = 'ok';
        });
        break;
    }
  }
}
