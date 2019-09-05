import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  var _groupValue;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(value: 0, groupValue: _groupValue, onChanged: (value){
                  setState(() {
                    _groupValue = value;
                    debugPrint('_groupValue:$value');
                  });
                }),
                Radio(value: 1, groupValue: _groupValue, onChanged: (value){
                  setState(() {
                    _groupValue = value;
                    debugPrint('_groupValue:$value');
                  });
                }),
              ],
            ),
            RadioListTile(
                value: 0, 
                groupValue: _groupValue, 
                title: Text('哈哈哈'),
                subtitle: Text("hahah"),
                selected: _groupValue==0,
                onChanged: (value){
              setState(() {
                _groupValue = value;
                debugPrint('_groupValue:$value');
              });
            }),
            RadioListTile(
                value: 1,
                groupValue: _groupValue,
                title: Text('哈哈哈'),
                subtitle: Text("hahah"),
                selected: _groupValue==1,
                onChanged: (value){
              setState(() {
                _groupValue = value;
                debugPrint('_groupValue:$value');
              });
            }),
          ],
        ),
      ),
    );;
  }
}
