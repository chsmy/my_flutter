import 'package:flutter/material.dart';

import 'AnimateDemo1.dart';
import 'AnimateDemo4.dart';
import 'AnimateDemo5.dart';
import 'AnimateDemo6.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimateDemo5(),
    );
  }
}



