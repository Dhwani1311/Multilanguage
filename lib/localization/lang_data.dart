import 'package:flutter/cupertino.dart';

abstract class LanguageData{
  static LanguageData of(BuildContext context) {
    return Localizations.of<LanguageData>(context, LanguageData);
  }

  String get appbar;
  String get welcomelabel;
  String get infolabel;
  String get selectlanguage;

}