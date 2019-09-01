import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StackDemo(),
        IconBadge(Icons.add,40),
//        AspectRadioDemo(),
        ConstrainedBoxDemo()
      ],
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
      minHeight: 60,
      maxWidth: 60,
        ),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}


class AspectRadioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4/3,
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}


class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 100.0,
          height: 30.0,
          child: Container(
            //对齐方式
            alignment: Alignment(1.0, 1.0),
            //装饰
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(Icons.unarchive,color: Colors.white,size: 32.0,),
          ),
        ),
        Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SizedBox(
              width: 100.0,
              height: 160.0,
              child: Container(
                //对齐方式
                alignment: Alignment(1.0, 1.0),
                //装饰
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(Icons.ac_unit,color: Colors.white,size: 20.0,),
              ),
            ),
            SizedBox(
              width: 60.0,
              height: 60.0,
              child: Container(
                //装饰
                decoration: BoxDecoration(
                    color: Colors.blue,
//                  borderRadius: BorderRadius.circular(10.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      Colors.blue,
                      Colors.blue[400],
                    ])
                ),
                child: Icon(Icons.brightness_2,color: Colors.white,size: 20.0,),
              ),
            ),
            Positioned(
              right: 20,
              top: 120,
              child: Icon(Icons.ac_unit,color: Colors.white,size: 20.0,),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: Icon(Icons.ac_unit,color: Colors.white,size: 20.0,),
            ),
            Positioned(
              right: 20,
              top: 40,
              child: Icon(Icons.ac_unit,color: Colors.white,size: 20.0,),
            ),
            Positioned(
              right: 25,
              top: 80,
              child: Icon(Icons.ac_unit,color: Colors.white,size: 20.0,),
            ),
            Positioned(
              right: 10,
              top: 60,
              child: Icon(Icons.ac_unit,color: Colors.white,size: 20.0,),
            ),
          ],
        )
      ],
    );
  }
}


class IconBadge extends StatelessWidget{

  final IconData icon;
  final double size;

  IconBadge(this.icon,this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,size: size,color: Colors.white,),
      color: Colors.blue,
      width: size+60,
      height: size+60,
    );
  }

}
