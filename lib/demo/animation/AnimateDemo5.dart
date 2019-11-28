import 'package:flutter/material.dart';

class AnimateDemo5 extends StatefulWidget {
  @override
  _AnimateDemo5State createState() => _AnimateDemo5State();
}

class _AnimateDemo5State extends State<AnimateDemo5> with TickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Center(
            child: StaggerAnimation(controller: _controller,),
          ),
          SizedBox(height: 30,),
          RaisedButton(
            child: Text("点击开始"),
            onPressed: () {
              _play();
            },
            textColor: Theme.of(context).primaryColor,
            splashColor: Colors.grey[400],
          )
        ],
      ),
    );
  }

  void _play() async{
    //先正向执行动画
    await _controller.forward().orCancel;
    //再反向执行动画
    await _controller.reverse().orCancel;
  }
}

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  Animation<double> width,height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;
  Animation<BorderRadius> borderRadius;

  StaggerAnimation({Key key,this.controller}): super(key:key){
    height = Tween<double>(
        begin: 0,
        end: 200)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0,0.4,curve: Curves.ease)));
    width = Tween<double>(
        begin: 50,
        end: 200)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0,0.4,curve: Curves.ease)));
    padding = Tween<EdgeInsets>(
      begin:EdgeInsets.only(left: .0),
      end:EdgeInsets.only(left: 100.0),
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)),);
    color = ColorTween(
      begin:Colors.green ,
      end:Colors.red,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.4, curve: Curves.ease,)));
    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(3),
      end: BorderRadius.circular(35),
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.4, 0.6,curve: Curves.ease,),));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context,child){
        return Container(
          alignment: Alignment.bottomCenter,
          padding:padding.value ,
          child: Container(
            width: width.value,
            height: height.value,
            decoration: BoxDecoration(
                color: color.value,
                border: Border.all(color: Colors.blue,width: 3),
                borderRadius:borderRadius.value
            ),
          ),
        );
      },
    );
  }
}
