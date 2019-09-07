import 'package:flutter/material.dart';
import '../model/post.dart';
class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body:
      Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((man){
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: Image.network(man.url,fit: BoxFit.cover,),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(man.url),
                    ),
                    title: Text(man.name),
                    subtitle: Text(man.title),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(man.desc,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Like'.toUpperCase()),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text('Read'.toUpperCase()),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },).toList(),
        ),
      ),
    );
  }
}
