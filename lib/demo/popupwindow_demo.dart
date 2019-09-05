import 'package:flutter/material.dart';

class PopupWindowDemo extends StatefulWidget {
  @override
  _PopupWindowDemoState createState() => _PopupWindowDemoState();
}

class _PopupWindowDemoState extends State<PopupWindowDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupWindowDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PopupMenuButton(
                  onSelected: (value){
                    debugPrint('value:$value');
                  },
                  itemBuilder: (context)=>[
                    PopupMenuItem(child: Text("add"),value: "add",),
                    PopupMenuItem(child: Text("update"),value: "update"),
                    PopupMenuItem(child: Text("delete"),value: "delete"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
