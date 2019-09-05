import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  @override
  Widget build(BuildContext context) {
    var _switched = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_switched?'笑脸':'不笑'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: _switched,
                  onChanged: (value){
                    setState(() {
                      _switched = value;
                      debugPrint("switch:$value");
                    });
                  },
                )
              ],
            ),
            SwitchListTile(
              value: _switched,
              onChanged: (value) {
                setState(() {
                  _switched = value;
                });
              },
              title: Text('Switch Item A'),
              subtitle: Text('Description'),
              secondary: Icon(_switched ? Icons.visibility : Icons.visibility_off),
              selected: _switched,
            )
          ],
        ),
      ),
    );;
  }
}
