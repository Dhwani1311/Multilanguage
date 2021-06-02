
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home/homepage.dart';
import 'localization/delegates.dart';
import 'localization/locale_const.dart';

void  main()=> runApp(MyApp());

class MyApp extends StatefulWidget{

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Multi Language",
        debugShowCheckedModeBanner: false,
        home:MyHomePage(),
        locale: _locale,
        supportedLocales: [
          Locale('en',''),
          Locale('es' ,''),
          Locale('hi' ,''),
          Locale('ar', ''),
          Locale('zh',''),
          Locale('it','')
        ],
        localizationsDelegates: [
          AppDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale?.languageCode == locale?.languageCode &&
                supportedLocale?.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        }

    );
  }
}