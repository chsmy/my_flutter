import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }

  Future<void> _selectDate() async{
    DateTime date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if( date== null) return;
    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selectTime() async{
    TimeOfDay timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime);
    if(timeOfDay == null) return;
    setState(() {
      selectedTime = timeOfDay;
    });
  }
}
