import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            pinned: true,
          floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("MY TITLE",style: TextStyle(fontSize: 16,letterSpacing: 3,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
              background: Image.network("https://c-ssl.duitang.com/uploads/blog/201307/09/20130709162215_a3y3Z.jpeg"
                ,fit: BoxFit.cover,),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 8,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(posts[index].url),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Column(
                    children: <Widget>[
                      Text(
                        posts[index].name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(posts[index].title)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(posts[index].url),
        );
      }, childCount: posts.length),
    );
  }
}
