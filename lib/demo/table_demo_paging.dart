import 'package:flutter/material.dart';
import '../model/post.dart';

class PagingTableDemo extends StatefulWidget {
  @override
  _PagingTableDemoState createState() => _PagingTableDemoState();
}

class _PagingTableDemoState extends State<PagingTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource _postDataSource = new PostDataSource();

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
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              header: Text('Man'),
              source: _postDataSource,
              rowsPerPage: 3,
              columns: [
                DataColumn(
                    label: Text('名字'),
                    onSort: (int index, bool isAscend) {
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = isAscend;
                      });
                    }),
                DataColumn(label: Text('职业')),
                DataColumn(label: Text('图片'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  final List<Man> _posts = posts;
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    Man man = _posts[index];
    return DataRow.byIndex(index: index,
        cells: [
          DataCell(Text(man.name)),
          DataCell(Text(man.title)),
          DataCell(Image.network(man.url)),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  int get selectedRowCount => _selectedCount;
}
