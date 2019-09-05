import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  @override
  Widget build(BuildContext context) {
    bool _checkBox = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _checkBox,
              onChanged: (value){
                setState(() {
                  _checkBox = value;
                  debugPrint('checkbox:$value');
                });
              },
              title: Text('A选项'),
              subtitle: Text('哈哈'),
              secondary: Icon(Icons.add),
              selected: _checkBox,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _checkBox,
                  tristate: true,
                  onChanged: (value){
                    setState(() {
                      _checkBox = value;
                      debugPrint('checkbox:$value');
                    });
                  },
                  checkColor: Colors.blue,
                  activeColor: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
    );;;
  }
}

