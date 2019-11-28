import 'package:flutter/material.dart';

class AnimateDemo1 extends StatefulWidget {
  @override
  _AnimateDemo1State createState() => _AnimateDemo1State();
}

class _AnimateDemo1State extends State<AnimateDemo1> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animationSize;
  Animation animationColor;
  CurvedAnimation curvedAnimation;

  Tween sizeTween;
  Tween colorTween;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this
    );
    //设置插值器  这里使用一个默认的插值器bounceInOut
    curvedAnimation = CurvedAnimation(parent: animationController,curve: Curves.bounceOut);
    animationSize = Tween(begin: 32.0,end: 100.0).animate(curvedAnimation);
    animationColor = ColorTween(begin: Colors.red,end: Colors.green).animate(curvedAnimation);
    animationController.addListener((){
      setState(() {});
    });
    sizeTween = Tween(begin: 32.0,end: 100.0);
    colorTween = ColorTween(begin: Colors.red,end: Colors.green);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
//        iconSize: animationSize.value,
//        color: animationColor.value,
        iconSize: sizeTween.evaluate(curvedAnimation),
        color: colorTween.evaluate(curvedAnimation),
        onPressed: (){
          switch(animationController.status){
            case AnimationStatus.completed:
              animationController.reverse();
              break;
            default:
              animationController.forward();
          }
        },
      ),
    );
  }
}