import 'package:flutter/material.dart';

import '../main.dart';
import 'animation/animation_demo.dart';
import 'form_demo.dart';
import 'material_components.dart';
//点击需要改变index的值，所以继承StatefulWidget
class BottomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<BottomNavigationBarDemo> {
  int currentIndex = 0;
  var currentPage;
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("home")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.message),
        title: Text("message")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_a_photo),
        title: Text("apply")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text("mine")
    ),
  ];
  final List<Widget> pages = [
    MyHomePage(),AnimationDemo(),MaterialComponentsDemo(),FormDemo()
  ];
  @override
  void initState() {
    currentPage = pages[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: _onTapHandler,
          items: bottomTabs
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }

  void _onTapHandler(int index) {
    setState(() {
      currentIndex = index;
      currentPage = pages[index];
    });
  }
}