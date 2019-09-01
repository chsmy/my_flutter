import 'package:flutter/material.dart';

class BasicTextDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://c-ssl.duitang.com/uploads/item/201408/15/20140815193141_FcYSx.png"),
        fit: BoxFit.cover),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.add_a_photo,size: 80,color: Colors.white,),
//            color: Colors.blue,
            width: 100,
            height: 100,
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.green,
                  width: 5.0,
                  style: BorderStyle.solid
              ),
              borderRadius:BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(10, 10),
                  color: Colors.blue,
                  blurRadius: 5,
                  spreadRadius: 5,
                ),
              ],
//              shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }

}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'CHS',
        style: TextStyle(
          fontSize: 26.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
          color: Colors.blue
        ),
        children: [
          TextSpan(
            text: '.com',
            style: TextStyle(
              fontSize: 16.0,
            )
          )
        ]
      ),
    );
  }
}


class TextDemo extends StatelessWidget{
  final TextStyle _textStyle = TextStyle(
    fontSize: 18.0,

  );

  final String _autor = "李白";
  final String _title = "俠客行";

  @override
  Widget build(BuildContext context) {
    return Text("《$_title》—— $_autor 。赵客缦胡缨，吴钩霜雪明。银鞍照白马，飒沓如流星。十步杀一人，"
        "千里不留行。事了拂衣去，深藏身与名。闲过信陵饮，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴。"
        "三杯吐然诺，五岳倒为轻。眼花耳热后，意气素霓生。救赵挥金槌，邯郸先震惊。"
        "千秋二壮士，煊赫大梁城。纵死侠骨香，不惭世上英。谁能书閤下，白首太玄经",style: _textStyle,);
  }

}