import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  var _sliderValue = 0.0;
  var _sliderValue1 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderValue,
                  onChanged: (value){
                    setState(() {
                      _sliderValue =value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Slider(
              value: _sliderValue1,
              onChanged: (value){
                setState(() {
                  _sliderValue1 =value;
                });
              },
              max: 10.0,
              min: 0.0,
              divisions: 10,
              label: '${_sliderValue1.toInt()}',
            ),
            Text('value:$_sliderValue1')
          ],
        ),
      ),
    );;
  }
}
