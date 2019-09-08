
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
//https://pub.dev/packages/rxdart
class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
      body: RxDartHome(),
    );
  }
}

class RxDartHome extends StatefulWidget {
  @override
  _RxDartHomeState createState() => _RxDartHomeState();
}

class _RxDartHomeState extends State<RxDartHome> {

  PublishSubject _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject.map((item) => '哈哈: $item')
     .where((item)=>item.length>10)
     .debounceTime(Duration(milliseconds: 500))
     .listen((data)=>debugPrint(data));

//    Observable _observable = Observable(Stream.fromIterable(['hello','你好']));
//    Observable _observable = Observable.fromFuture(Future.value('hello'));
//    Observable _observable = Observable.fromIterable(["hello",'你好']);
//    Observable _observable = Observable.just('haha');
//      Observable _observable = Observable.periodic(Duration(seconds: 3),(x)=>x.toString());
//    _observable.listen(print);

//    PublishSubject<String> _subject = PublishSubject<String>();
//    BehaviorSubject<String> _subject = BehaviorSubject<String>();
//      ReplaySubject<String> _subject = ReplaySubject<String>();
//      ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
//    _subject.add("hello");
//    _subject.add("你好");
//    _subject.add("哈哈");
//    _subject.listen((data)=>debugPrint('listen1 :$data'));
//    _subject.listen((data)=>debugPrint('listen2 :$data'));
//    _subject.close();
  }
  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: TextField(
          onChanged: (value){
            _textFieldSubject.add("输入了:$value");
          },
          decoration: InputDecoration(
            labelText: 'Title',
            filled: true,
          ),
        ),
      ),
    );
  }
}

