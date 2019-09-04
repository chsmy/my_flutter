import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDetailDemo extends StatelessWidget {

  Man man;

  ListViewDetailDemo(@required this.man);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(man.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 4/3,
            child: Image.network(man.url),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
               children: <Widget>[
                 Text(man.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 Text(man.name,style: TextStyle(fontSize: 16),),
                 Text(man.desc,style: TextStyle(fontSize: 14),),
               ],
            ),
          )
        ],
      ),
    );
  }
}
