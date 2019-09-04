import 'package:flutter/material.dart';
import '../model/post.dart';
import 'listview_detail.dart';

class ListViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: _listItemBuilder,itemCount: posts.length,);
  }
//构建item
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),//设置外边距
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height:10.0),//分割线
              Text(posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(posts[index].name,style: Theme.of(context).textTheme.subhead,),
              //从网络获取图片并显示在Image上
             AspectRatio(
               aspectRatio: 2/1,
               child:  Image.network(posts[index].url),
             ),
              SizedBox(height:10.0),
            ],
          ),
          Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: (){
                    Navigator.of(context).
                    push(MaterialPageRoute(builder: (context)=>ListViewDetailDemo(posts[index])));
                  },
                ),
              ))
        ],
      ),
    );
  }
}