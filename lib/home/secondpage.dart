
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lang/localization/lang_data.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
              child:Text(LanguageData
                  .of(context)
                  .welcomelabel,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),

          ),
        ),
    );
  }
}