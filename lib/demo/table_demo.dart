import 'package:flutter/material.dart';
import '../model/post.dart';
class TableDemo extends StatefulWidget {
  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(label: Text('名字'),
                onSort: (int index,bool isAscend){
                  setState(() {
                    _sortColumnIndex = index;
                    _sortAscending = isAscend;
                  });
                }),
                DataColumn(label: Text('职业')),
                DataColumn(label: Text('图片'))
              ],
              rows: posts.map((man){
                  return DataRow(
                    selected: man.selected,
                    onSelectChanged: (value){
                      setState(() {
                        if(man.selected!=value){
                          man.selected = value;
                        }
                      });
                    },
                    cells: [
                      DataCell(
                          Text(man.name),
                      ),
                      DataCell(
                          Text(man.title),
                      ),
                      DataCell(
                          Image.network(man.url),
                      )
                    ]
                  );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
