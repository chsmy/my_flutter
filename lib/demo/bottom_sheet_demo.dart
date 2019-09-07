import 'package:flutter/material.dart';
import 'dart:async';
class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetAndSnackBarDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('showBottonSheet'),
                  onPressed: _showBottomSheet,
                ),
                SizedBox(width: 15.0,),
                RaisedButton(
                  child: Text('showModelBottonSheet'),
                  onPressed: _showModelBottomSheet,
                ),
              ],
            ),
            FlatButton(
              child: Text('showSnakBar'),
              onPressed: _showSnackBar,
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(){
     _bottomSheetScaffoldKey.currentState.showBottomSheet((context){
         return BottomAppBar(
           child: Container(
             height: 90.0,
             padding: EdgeInsets.all(10.0),
             width: double.infinity,
             child: Row(
               children: <Widget>[
                 Icon(Icons.ac_unit),
                 SizedBox(width: 20.0),
                 Text("hahhhhhhhh")
               ],
             ),
           ),
         );
    });
  }

  Future _showModelBottomSheet() async{
   final option = await showModalBottomSheet(context: context, builder: (context){
     return Container(
       height: 200.0,
       child: Column(
         children: <Widget>[
           ListTile(
             title: Text('option A'),
             onTap: (){
               Navigator.pop(context,'A');
             },
           ),
           ListTile(
             title: Text('option B'),
             onTap: (){
               Navigator.pop(context,'B');
             },
           ),
           ListTile(
             title: Text('option C'),
             onTap: (){
               Navigator.pop(context,'C');
             },
           ),
         ],
       ),
     );
   });
   print(option);
  }

  void _showSnackBar() {
    debugPrint('_showSnackBar 点击了');

    _bottomSheetScaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Processing...'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        )
    );
  }
}
