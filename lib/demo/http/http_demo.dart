import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://pub.dev/packages/http
class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpRequest(),
    );
  }
}

class HttpRequest extends StatefulWidget {

  @override
  _HttpRequestState createState() => _HttpRequestState();
}

class _HttpRequestState extends State<HttpRequest> {

  var url = 'http://gank.io/api/xiandu/category/wow';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        if(snapshot.connectionState == ConnectionState.waiting){
           return Center(
            child: Text('loading...'),
          );
        }else{
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.created_at),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.icon),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
  @override
  void initState() {
    super.initState();
//    getData().then((value)=>debugPrint(value.toString()));

    //测试json转换
//    final posts = {
//      'title':"i am title",
//      'desc':'i am desc'
//    };
//    final jsonData = json.encode(posts);
//    debugPrint(jsonData);
//
//    final jsonMap = json.decode(jsonData);
//    debugPrint('title:${jsonMap['title']}');
//    debugPrint('desc:${jsonMap['desc']}');
//
//    final postModel = Post.fromJson(jsonMap);
//    debugPrint('title:${postModel.title} desc:${postModel.desc}');
//
//    debugPrint('json: ${json.encode(postModel)}');
  }
  Future<List<GanData>> getData() async{
     final respnose = await http.get(url);
//     debugPrint('response:${respnose.statusCode}');
//     debugPrint('response:${respnose.body}');
     if(respnose.statusCode == 200){
       final res = json.decode(respnose.body);

       List<GanData> data = res['results']
           .map<GanData>((item) => GanData.fromJson(item))
           .toList();
       return data;
     }else{
       throw Exception('获取数据出错啦！');
     }
  }
}

class GanData{

  String created_at;
  String icon;
  String id;
  String title;

  GanData(
      this.created_at,
      this.icon,
      this.id,
      this.title);
  GanData.fromJson(Map json)
      : created_at=json['created_at'],icon = json['icon'],
        id = json['id'],title = json['title'];
  Map toJson() =>{
    'createdAt':created_at,
    'icon':icon,
    'id':id,
    'title':title,
  };
}

class Post{
  String title;
  String desc;
  Post(this.title,this.desc);

  Post.fromJson(Map json)
      : title=json['title'],desc = json['desc'];

  Map toJson() =>{
    'title':title,
    'desc':desc
  };
}