import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lang/localization/Language/hindi.dart';
import 'package:flutter_lang/localization/lang_data.dart';

import 'Language/arebic.dart';
import 'Language/chinese.dart';
import 'Language/english.dart';
import 'Language/hindi.dart';
import 'Language/italian.dart';
import 'Language/spanish.dart';
import 'lang_data.dart';

class AppDelegate extends LocalizationsDelegate<LanguageData>{
  @override
  bool isSupported(Locale locale) {
    return ['en','hi','ar','zh','it','es'].contains(locale.languageCode);
  }

  @override
  Future<LanguageData> load(Locale locale) {
        return _load(locale);
  }

  static Future<LanguageData> _load(Locale locale)async{
    switch(locale.languageCode){
      case 'en':
        return LanguageEn();
      case 'hi':
        return LanguageHi();
      case 'es':
        return LanguageEs();
      case 'ar':
        return LanguageAr();
      case 'zh':
        return LanguageCn();
      case 'it':
        return LanguageIt();
      default:
        return LanguageEn();

    }
  }
  @override
  bool shouldReload(covariant LocalizationsDelegate<LanguageData> old) {
   return false;
  }

}
