import 'package:flutter/material.dart';

//Hero动画

class AnimateDemo4 extends StatefulWidget {
  @override
  _AnimateDemo4State createState() => _AnimateDemo4State();
}

class _AnimateDemo4State extends State<AnimateDemo4> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Hero(
          tag: "avator",
          child: ClipOval(
            child: Image.network('http://ww1.sinaimg.cn/large/0065oQSqly1fsfq1k9cb5j30sg0y7q61.jpg',width: 100,),
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return Scaffold(
              body: Center(
                child: Hero(
                  tag: "avator",
                  child: Image.network('http://ww1.sinaimg.cn/large/0065oQSqly1fsfq1k9cb5j30sg0y7q61.jpg'),
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}
