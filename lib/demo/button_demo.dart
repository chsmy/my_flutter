import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("button"),
                  onPressed: () {},
                  textColor: Theme.of(context).primaryColor,
                  splashColor: Colors.grey[400],
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('add'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("button"),
                  onPressed: () {},
                  textColor: Theme.of(context).primaryColor,
                  splashColor: Colors.grey[400],
                ),
                SizedBox(width: 10),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('add'),
                  elevation: 0.0,
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                      buttonColor: Theme.of(context).primaryColor,
                      buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                          shape: StadiumBorder()
                      )
                  ),
                  child:  RaisedButton(
                    child: Text("button"),
                    onPressed: () {},
                    textColor: Colors.white,
                    splashColor: Colors.grey[400],
                  ),
                ),
                SizedBox(width: 10),
                Theme(
                  data: Theme.of(context).copyWith(
                      buttonColor: Theme.of(context).primaryColor,
                      buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      )
                  ),
                  child:  RaisedButton(
                    child: Text("button"),
                    onPressed: () {},
                    textColor: Colors.white,
                    splashColor: Colors.grey[400],
                  ),
                ),
                SizedBox(width: 10),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('add'),
                  elevation: 0.0,
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  child: Text("button"),
                  onPressed: () {},
                  textColor: Theme.of(context).primaryColor,
                  splashColor: Colors.grey[400],
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                OutlineButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('add'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 160.0,
                  child: OutlineButton(
                    child: Text("button"),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                    splashColor: Colors.grey[400],
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: OutlineButton(
                    child: Text("button"),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                    splashColor: Colors.grey[400],
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlineButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('add'),
                    textColor: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                      buttonTheme: ButtonThemeData(
                          padding: EdgeInsets.all(8)
                      )
                  ),
                  child:  ButtonBar(
                    children: <Widget>[
                      OutlineButton(
                        child: Text("button"),
                        onPressed: () {},
                        textColor: Theme.of(context).primaryColor,
                        splashColor: Colors.grey[400],
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      OutlineButton(
                        child: Text("button"),
                        onPressed: () {},
                        textColor: Theme.of(context).primaryColor,
                        splashColor: Colors.grey[400],
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}