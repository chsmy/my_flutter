import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter/demo/i18n/intl/messages_all.dart';

class MyDemoLocalization{
//flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n/intl lib/demo/i18n/intl/my_demo_localization.dart
// lib/demo/i18n/intl/intl_*.arb   D:\android\A3\my_flutter\lib\demo\i18n\intl\intl_zh.arb
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/demo/i18n/intl --no-use-deferred-loading lib/demo/i18n/intl/my_demo_localization.dart lib/demo/i18n/intl/intl_*.arb

//D:\android\A3\my_flutter\lib\demo\i18n\intl
 // flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/demo/i18n/intl
  // --no-use-deferred-loading lib/demo/i18n/intl/my_demo_localization.dart lib/demo/i18n/intl/intl_* .arb

  static MyDemoLocalization of(BuildContext context){
    return Localizations.of<MyDemoLocalization>(context, MyDemoLocalization);
  }

  static Future<MyDemoLocalization> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return MyDemoLocalization();
    });
  }

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }
  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'greet someone.',
    args: [name],
  );
}

class MyDemoLocalizationsDelegate
    extends LocalizationsDelegate<MyDemoLocalization> {

  const MyDemoLocalizationsDelegate();

  @override
  Future<MyDemoLocalization> load(Locale locale) {
    return MyDemoLocalization.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyDemoLocalization> old) {
    return false;
  }
}