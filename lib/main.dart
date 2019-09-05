import 'package:flutter/material.dart';
import 'demo/ListView_demo.dart';
import 'demo/Drawer_demo.dart';
import 'demo/BottomNavigationBar_demo.dart';
import 'demo/BasicText_demo.dart';
import 'demo/LayoutDemo.dart';
import 'demo/View_demo.dart';
import 'demo/Sliver_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';

void main() => runApp(MyApp());

//新建一个自己的app
class MyApp extends StatelessWidget {
  // 小部件的根
  @override
  Widget build(BuildContext context) {
    //使用材料风格
    return MaterialApp(
      //关闭debug标签
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //应用主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/mat',
      routes: {
        '/': (context) => MyHomePage(title: "my title"),
        '/form': (context) => FormDemo(),
        '/mat':(context)=>MaterialComponentsDemo()
      },
//      home: MyHomePage(title: "my title",),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        //头部
        appBar: AppBar(
          title: Text(title),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => debugPrint("search clicked")),
          ],
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.access_alarm)),
                Tab(icon: Icon(Icons.accessibility)),
                Tab(icon: Icon(Icons.account_balance)),
                Tab(icon: Icon(Icons.cached)),
                Tab(icon: Icon(Icons.date_range)),
              ]),
        ),
        //使用ListView.builder来创建一个列表 itemCount 列表条数  _listItemBuilder构建item的方法
        body: TabBarView(children: <Widget>[
          ListViewDemo(),
          BasicTextDemo(),
          LayoutDemo(),
          View_demo(),
          SliverDemo()
        ]),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
