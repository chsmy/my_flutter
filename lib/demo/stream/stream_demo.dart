
import 'package:flutter/material.dart';
import 'dart:async';
class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamHomeDemo(),
    );;
  }
}
//Stream 就是事件流或者管道
class StreamHomeDemo extends StatefulWidget {
  @override
  _StreamHomeDemoState createState() => _StreamHomeDemoState();
}

class _StreamHomeDemoState extends State<StreamHomeDemo> {
  //用来 暂停 恢复 管理stream
  StreamSubscription _streamSubscription;
  //用来控制stream
  StreamController<String> _streamController;
  //使用sink 水槽控制stream
  StreamSink _streamSink;
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    debugPrint('stream create');
//    Stream<String> _steam = Stream.fromFuture(getData());
//    _streamController = StreamController<String>();
    //可以创建多个订阅
    _streamController = StreamController.broadcast();
    _streamSink = _streamController.sink;
    debugPrint('stream start listening');
//    _streamSubscription =  _steam.listen(onData, onError: onError, onDone: onDone);
    _streamSubscription =  _streamController.stream.listen(onData, onError: onError, onDone: onDone);
    //添加多次订阅
    _streamController.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    debugPrint('stream Initialize completed.');
  }

  void onDone(){
    debugPrint('stream onDone');
  }
  void onError(error){
    debugPrint('stream $error');
  }
  void onData(String data){
    debugPrint(data);
  }
  void onDataTwo(String data){
    debugPrint(data);
  }
  //模拟异步的数据
  //2019-09-08 17:47:17.044 16001-16129/com.chs.my_flutter I/flutter: stream create
  //2019-09-08 17:47:17.052 16001-16129/com.chs.my_flutter I/flutter: stream start listening
  //2019-09-08 17:47:17.057 16001-16129/com.chs.my_flutter I/flutter: stream Initialize completed.
  //2019-09-08 17:47:20.052 16001-16129/com.chs.my_flutter I/flutter: stream result hello ~
  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 5));
//     throw 'Something happened';
    return 'stream result hello ~';
  }
  void _addDataToStream() async{
    debugPrint('Add data to stream.');
    String data = await getData();
//    _streamController.add(data);
    _streamSink.add(data);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: _streamController.stream,
            initialData: '空空',
            builder: (context, snapshot) {
              return Text('${snapshot.data}');
            },
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('添加数据'),
                onPressed: _addDataToStream,
              ),
              SizedBox(width: 5.0,),
              RaisedButton(
                child: Text('暂停'),
                onPressed: (){
                  debugPrint('stream 暂停了');
                  _streamSubscription.pause();
                },
              ),
              SizedBox(width: 5.0,),
              RaisedButton(
                child: Text('恢复'),
                onPressed: (){
                  debugPrint('stream 恢复了');
                  _streamSubscription.resume();
                },
              ),
              SizedBox(width: 5.0,),
              RaisedButton(
                child: Text('取消'),
                onPressed: (){
                  debugPrint('stream 取消了');
                  _streamSubscription.cancel();
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}

