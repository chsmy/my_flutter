import 'package:flutter/material.dart';
import '../model/post.dart';

class View_demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: posts.length,
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: _buildItem);
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].url,
        fit: BoxFit.cover,
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      crossAxisSpacing: 16.0, //横向间距
      mainAxisSpacing: 16.0, //纵向间距
//      scrollDirection: Axis.horizontal,//滚动方向
      children: _childrenbuild(100),
    );
  }

  List<Widget> _childrenbuild(int length) {
    return List.generate(length, (index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          "item",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
        ),
      );
    });
  }
}

class GridViewCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0, //横向间距
      mainAxisSpacing: 16.0, //纵向间距
//      scrollDirection: Axis.horizontal,//滚动方向
      children: _childrenbuild(100),
    );
  }

  List<Widget> _childrenbuild(int length) {
    return List.generate(length, (index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          "item",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
        ),
      );
    });
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: posts.length, itemBuilder: _pageItemBuilder);
  }

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 15.0,
          right: 15.0,
          child: Column(
            children: <Widget>[
              Text(
                posts[index].name,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].title,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
//      reverse: true,//翻转
//      scrollDirection: Axis.vertical,//翻页的方向
      onPageChanged: (currentPage) => debugPrint("page: $currentPage"),
      controller: PageController(
        initialPage: 1,
//        viewportFraction: 0.8//占屏幕的比例
      ),
      children: <Widget>[
        Container(
          color: Colors.blueGrey,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "ONE",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.deepOrange,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "TOW",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.cyan,
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "THREE",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
    ;
  }
}
