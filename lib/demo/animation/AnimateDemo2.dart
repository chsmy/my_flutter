import 'package:flutter/material.dart';

class AnimateDemo2 extends StatefulWidget {
  @override
  _AnimateDemo2State createState() => _AnimateDemo2State();
}

class _AnimateDemo2State extends State<AnimateDemo2> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animationSize;
  Animation animationColor;
  CurvedAnimation curvedAnimation;
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
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationHeart(
        animations: [
          animationSize,animationColor
        ],
        controller: animationController,
      ),
    );
  }
}

class AnimationHeart extends AnimatedWidget{
  AnimationController controller;
  List animations;
  AnimationHeart({ this.animations,
    this.controller,}):super(listenable:controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: (){
        switch(controller.status){
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}