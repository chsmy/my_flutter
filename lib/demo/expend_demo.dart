import 'package:flutter/material.dart';

class ExpandDemo extends StatefulWidget {
  @override
  _ExpandDemoState createState() => _ExpandDemoState();
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}
class _ExpandDemoState extends State<ExpandDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;
  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
        ),
        isExpanded: false,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpandDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ExpansionPanelList(
                  children: _expansionPanelItems.map(
                          (ExpansionPanelItem item) {
                        return ExpansionPanel(
                          isExpanded: item.isExpanded,
                          body: item.body,
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                item.headerText,
                                style: Theme.of(context).textTheme.title,
                              ),
                            );
                          },
                        );
                      }
                  ).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
