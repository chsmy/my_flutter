import 'package:flutter/material.dart';
//点击需要改变index的值，所以继承StatefulWidget
class BottomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        items: [
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
        ]);
  }

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}