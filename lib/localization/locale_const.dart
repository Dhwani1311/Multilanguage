import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

String prefselectedlanguage = 'SelectLanguage';

Future<Locale> setLocale(String languagecode)async{

 SharedPreferences _pref = await SharedPreferences.getInstance();
  await _pref.setString(prefselectedlanguage,languagecode);
  return _locale(languagecode);
}


Future<Locale> getLocale()async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  String languagecode = _pref.getString(prefselectedlanguage)?? 'en';
  return _locale(languagecode);
}

Locale _locale(String languagecode){
  return languagecode !=null && languagecode.isNotEmpty ? Locale(languagecode,"") : Locale('en','');
}

void changeLanguage(BuildContext context,String selectlanguagecode)async{
    var _locale = await setLocale(selectlanguagecode);
    MyApp.setLocale(context,_locale);
}
