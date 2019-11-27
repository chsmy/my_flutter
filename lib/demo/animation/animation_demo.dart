import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin{

  AnimationController animationController;

  Animation animation;
  Animation animationColor;
  //正常的动画都是线性的 CurvedAnimation可以让它是曲线的，就像Android属性动画中的插值器
  CurvedAnimation curvedAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
//      lowerBound: 32.0,
//      upperBound: 100.0,
      duration: Duration(milliseconds: 2000),
      vsync: this
    );

    //设置插值器  使用一个默认的插值器bounceInOut
    curvedAnimation = CurvedAnimation(parent: animationController,curve: Curves.bounceOut);

    animation = Tween(begin: 32.0,end: 100.0).animate(curvedAnimation);
    animationColor = ColorTween(begin: Colors.red,end: Colors.green).animate(curvedAnimation);

//    animation.addListener((){
//      //调用setState来刷新界面
//      setState(() {
//      });
//    });
//    animation.addStatusListener((status){
//      debugPrint('status $status');
//      switch (status){
//        case AnimationStatus.dismissed:
//          break;
//        case AnimationStatus.forward:
//          break;
//        case AnimationStatus.reverse:
//          break;
//        case AnimationStatus.completed:
//          break;
//      }
//    });
//    animationController.addListener((){
//      debugPrint('value ${animationController.value}');
//      setState(() {
//
//      });
//    });
    animationController.addStatusListener((status){
      debugPrint('status $status');
    });
//    animationController.forward();
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
           animation,animationColor
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
//        iconSize: animationController.value,
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


