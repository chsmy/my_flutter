import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //头部用户信息
          UserAccountsDrawerHeader(
            //圆形头像
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("http://b-ssl.duitang.com/uploads/item/201712/22/20171222223729_d8HCB.jpeg"),
            ),
            accountName: Text("CHS",style: TextStyle(color: Colors.black),),
            accountEmail: Text("chs@163.com",style: TextStyle(color: Colors.black87),),
            //设置头部背景
            decoration: BoxDecoration(
              color: Colors.blue[400],
              //网络图片
              image: DecorationImage(image: NetworkImage("https://c-ssl.duitang.com/uploads/item/201408/07/20140807205323_8KxNf.jpeg"),
                  //填充样式
                  fit: BoxFit.cover,
                  //颜色滤镜
                  colorFilter: ColorFilter.mode(Colors.blue[400].withOpacity(0.6), BlendMode.hardLight)
              ),
            ),
          ),
          ListTile(
            title: Text("Message",textAlign: TextAlign.right,),
            trailing: Icon(Icons.message),
            onTap: ()=>(Navigator.pop(context)),
          ),
          ListTile(
            title: Text("Setting",textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings),
            onTap: ()=>(Navigator.pop(context)),
          ),
          ListTile(
            title: Text("MineVoice",textAlign: TextAlign.right,),
            trailing: Icon(Icons.mic_none),
            onTap: ()=>(Navigator.pop(context)),
          ),
        ],
      ),
    );
  }
}