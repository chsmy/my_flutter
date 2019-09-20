import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
class MyLocalization{
  final Locale locale;

  MyLocalization(this.locale);

  static MyLocalization of(BuildContext context) {
    return Localizations.of<MyLocalization>(context, MyLocalization);
  }

  static Map<String,Map<String,String>> _localized = {
    'en':{
      'title': 'hello',
    },
    'zh':{
      'title': '你好',
    }
  };
  String get title {
    debugPrint('local>>>>>>>${locale.languageCode}');
    return _localized[locale.languageCode]['title'];
  }
}



class MyLocalizationDelegate extends LocalizationsDelegate<MyLocalization>{

  MyLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<MyLocalization> load(Locale locale) {
    return SynchronousFuture<MyLocalization>(MyLocalization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
    return false;
  }

}