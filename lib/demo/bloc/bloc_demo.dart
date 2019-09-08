
import 'dart:async';

import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
        ),
        body: CountHome(),
        floatingActionButton: CountFloatButton(),
      ),
    );
  }
}

class CountHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = ContentProvider.of(context).bloc;
    return Container(
      child: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: _counterBloc.countStream,
          builder: (context, snapshot){
            return ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: (){
//            _counterBloc.log();
                _counterBloc.counter.add(1);
              },
            );
          },
        ),
      ),
    );
  }
}

class CountFloatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = ContentProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
//        _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class ContentProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  const ContentProvider({
    this.bloc,
    this.child,
  }): assert(child != null),
        super(child: child);

  static ContentProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(
        ContentProvider) as ContentProvider;
  }

  @override
  bool updateShouldNotify(ContentProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _streamController = StreamController<int>();
  StreamSink get counter => _streamController.sink;

  final _countController =  StreamController<int>();
  Stream get countStream => _countController.stream;

  CounterBloc(){
    _streamController.stream.listen(onData);
  }

  void onData(int value){
     debugPrint('value:$value');
     _count++;
     _countController.add(_count);
  }

  void disponse(){
    _streamController.close();
    _countController.close();
  }

  void log(){
    debugPrint('哈哈');
  }
}

