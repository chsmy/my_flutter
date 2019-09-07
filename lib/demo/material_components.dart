import 'package:flutter/material.dart';
import 'button_demo.dart';
import 'popupwindow_demo.dart';
import 'form_demo.dart';
import 'checkbox_demo.dart';
import 'radio_demo.dart';
import 'switch_demo.dart';
import 'slider_demo.dart';
import 'datetime_demo.dart';
import 'dialog_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'expend_demo.dart';
import 'chip_demo.dart';
import 'table_demo.dart';
import 'table_demo_paging.dart';
import 'card_demo.dart';
import 'step_line_demo.dart';
class MaterialComponentsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('material components'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListViewItem(
              title: "FloatingActionButton", page: FloatingActionButtonDemo()),
          ListViewItem(title: "Button", page: ButtonDemo()),
          ListViewItem(title: "PopupWindowDemo", page: PopupWindowDemo()),
          ListViewItem(title: "form", page: FormDemo()),
          ListViewItem(title: "CheckBoxDemo", page: CheckBoxDemo()),
          ListViewItem(title: "RadioDemo", page: RadioDemo()),
          ListViewItem(title: "SwitchDemo", page: SwitchDemo()),
          ListViewItem(title: "SliderDemo", page: SliderDemo()),
          ListViewItem(title: "DateTimeDemo", page: DateTimeDemo()),
          ListViewItem(title: "SimpleDialogDemo", page: SimpleDialogDemo()),
          ListViewItem(title: "AlertDialogDemo", page: AlertDialogDemo()),
          ListViewItem(title: "ExpandDemo", page: ExpandDemo()),
          ListViewItem(title: "BottomSheetAndSnackBarDemo", page: BottomSheetDemo()),
          ListViewItem(title: "ChipDemo", page: ChipDemo()),
          ListViewItem(title: "TableDemo", page: TableDemo()),
          ListViewItem(title: "PagingTableDemo", page: PagingTableDemo()),
          ListViewItem(title: "CardDemo", page: CardDemo()),
          ListViewItem(title: "StepDemo", page: StepDemo()),
        ],
      ),
    );
  }
}



class WidgetDemo extends StatelessWidget {
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
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  var _floatingActionButtonDemo = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
//    shape: BeveledRectangleBorder(
//      borderRadius: BorderRadius.circular(30)
//    ),
  );
  var _floatingActionButtonExtendDemo = FloatingActionButton.extended(
      onPressed: () {}, icon: Icon(Icons.add), label: Text('add'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
      ),
      floatingActionButton: _floatingActionButtonDemo,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListViewItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
