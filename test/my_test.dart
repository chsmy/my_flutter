
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter/demo/test/my_test.dart';

void main(){

  test('返回hello+something', (){
    String testString = MyTestDemo.test('大海');
    expect(testString, 'hello大海');
  });

}