import 'package:flutter/material.dart';

class AnimateDemo3 extends StatefulWidget {
  @override
  _AnimateDemo3State createState() => _AnimateDemo3State();
}

class _AnimateDemo3State extends State<AnimateDemo3> with SingleTickerProviderStateMixin{
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
//    return AnimatedBuilder(
//      animation: animationController,
//      builder: (context,child){
//        return Center(
//          child: IconButton(
//            icon: Icon(Icons.favorite),
//            iconSize: animationSize.value,
//            color: animationColor.value,
//            onPressed: (){
//              switch(animationController.status){
//                case AnimationStatus.completed:
//                  animationController.reverse();
//                  break;
//                default:
//                  animationController.forward();
//              }
//            },
//          ),
//        );
//      },
//    );
    return Center(
        child: Column(
          children: <Widget>[
            ScaleAnimate(
                animation: animationSize,
                child: Image.network('http://ww1.sinaimg.cn/large/0065oQSqly1fsfq1k9cb5j30sg0y7q61.jpg')
            ),
            SizedBox(height: 30,),
            InkWell(
              child: Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              onTap: (){
                switch(animationController.status){
                  case AnimationStatus.completed:
                    animationController.reverse();
                    break;
                  default:
                    animationController.forward();
                }
              },
            )
          ],
        )
    );
  }
}

class ScaleAnimate extends StatelessWidget {
  final Animation animation;
  final Widget child;
  ScaleAnimate({@required this.animation,@required this.child});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context,child){
        return SizedBox(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}