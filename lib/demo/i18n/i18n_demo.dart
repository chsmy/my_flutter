
import 'package:flutter/material.dart';
import 'package:my_flutter/demo/i18n/map/my_localization.dart';
import 'package:my_flutter/demo/i18n/intl/my_demo_localization.dart';

//https://flutterchina.club/tutorials/internationalization/

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
      ),
      body: I18nDemoHone(),
    );
  }
}

class I18nDemoHone extends StatefulWidget {
  @override
  _I18nDemoHoneState createState() => _I18nDemoHoneState();
}

class _I18nDemoHoneState extends State<I18nDemoHone> {

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(locale.languageCode),
            Text(
//                MyDemoLocalization.of(context).title
                  MyDemoLocalization.of(context).greet('dog')
//                Localizations.of(context, MyLocalization).title,
//                MyLocalization.of(context).title
                ),
          ],
        ),
      ),
    );
  }
}

