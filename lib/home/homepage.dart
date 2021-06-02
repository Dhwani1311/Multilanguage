
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lang/home/secondpage.dart';
import 'package:flutter_lang/localization/lang_data.dart';
import 'package:flutter_lang/localization/locale_const.dart';
import 'package:flutter_lang/model/language.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(title: Center(
          child: Text(LanguageData
              .of(context)
              .appbar),
        ),
        leading: IconButton(icon: Icon(Icons.playlist_add_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            }),
        actions: [
          _popupMenu(),

        ],),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200,),
                Text(LanguageData
                    .of(context)
                    .welcomelabel,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 30,),
                Center(
                  child: Text(LanguageData
                      .of(context)
                      .infolabel,
                    style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 30,),

              ],
            ),
          ),
        ),
      );

  _popupMenu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton<Language>(
          icon: Icon(Icons.add),
          iconSize: 30,
          onSelected: _select,
          itemBuilder: (BuildContext context) {
            return Language.choicelist().map((Language choice) {
              return PopupMenuItem(
                value: choice,
                child: Text(choice.name),
              );
            }).toList();
          },
      ),
    );
  }
  void _select(Language language){
    changeLanguage(context, language.languageCode);
  }
}
