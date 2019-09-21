
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mobx/mobx.dart';
//包含生成的文件
part 'state_manager_demo.g.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  int _count = 0;
  void countCallBack(){
    setState(() {
      _count++;
    });
    debugPrint('$_count');
  }
  @override
  Widget build(BuildContext context) {
    return ContentProvider(
      count: _count,
      countCallBack: countCallBack,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagerDemo'),
          elevation: 0.0,
        ),
        body: Counter1(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: countCallBack,
        ),
      ),
    );
  }
}

class Counter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = ContentProvider.of(context).count;
    final VoidCallback voidCallback = ContentProvider.of(context).countCallBack;
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: voidCallback,
      ),
    );
  }
}
class Counter0 extends StatelessWidget {
  final int count;
  Counter0(this.count);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$count'),
      ),
    );
  }
}
//class Counter extends StatelessWidget {
//  final int count;
//  final VoidCallback voidCallback;
//  Counter(this.count,this.voidCallback);
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: ActionChip(
//        label: Text('$count'),
//        onPressed: voidCallback,
//      ),
//    );
//  }
//}
//使用InheritedWidget来管理状态，
class ContentProvider extends InheritedWidget {
  final int count;
  final VoidCallback countCallBack;
  final Widget child;
  const ContentProvider({
    this. count,
     this. countCallBack,
    this. child,
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


//使用 ScopedModel来完成状态管理
//该库最初是从Fuchsia代码库中提取的
//https://pub.dev/packages/scoped_model
//该库主要分为三个部分
//1 Model class 扩展此类以创建自己的模型，例如SearchModel或UserModel。我们可以监听数据的变化！
//2 ScopedModel 小部件 把Model包装到ScopedModel中，它内部的所有部件都能拿到model中的数据
//3 ScopedModelDescendant 只要Model发生改变 它就会改变
class StateModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
      model: CountModel() ,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateModelDemo'),
        ),
        body: Counter2(),
        floatingActionButton: ScopedModelDescendant<CountModel>(
          rebuildOnChange: false,
          builder: (context, child, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              model.countIncrease();
            },
          ),
        ),
      ),
    );
  }
}

class Counter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model) => Center(
        child: ActionChip(
          label: Text('${model.count}'),
          onPressed: (){
            model.countIncrease();
          },
        ),
      ),
    );
  }
}

class CountModel extends Model{
   int _count = 0;
   int get count =>_count;

   void countIncrease(){
     _count ++;
     notifyListeners();
   }
}


//flutter_mobx
//https://pub.dev/packages?q=Mobx
//https://github.com/mobxjs/mobx.dart/tree/master/mobx_codegen
//生成 flutter packages pub run build_runner build
//更改 pub run build_runner watch

class Counter = _Counter3 with _$Counter;

abstract class _Counter3 with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

class MobxDemo extends StatefulWidget {
  @override
  _MobxDemoState createState() => _MobxDemoState();
}

class _MobxDemoState extends State<MobxDemo> {
  final Counter counter = Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateModelDemo'),
      ),

      body: Center(
        child: Observer(
            builder: (_)=>ActionChip(
              label: Text('${counter.value}'),
              onPressed: (){
                counter.increment();
              },
            ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){
          counter.increment();
        },
      ),
    );
  }
}
