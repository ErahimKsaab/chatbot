

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
class LISTTILE{
  String tittle,subtittle,image;
  Function nav;
  LISTTILE({this.tittle, this.subtittle, this.image,this.nav});
}
enum TabItem { jobs, account }

class TabItemData {
  const TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.jobs: TabItemData(title: 'ChatBot', icon: Icons.chat),
    TabItem.account: TabItemData(title: 'Map', icon: Icons.map),
  };
}
dialogs({BuildContext context, String C, String t,  VoidCallback F,String a,bool click}){
  if(!Platform.isIOS){
    showDialog(barrierDismissible: click,context: context,builder: (context) {
      return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Text(t),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(C),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(a),
            onPressed:F,
          ),
        ],
      );
    },);
  }else{
    return showCupertinoDialog(context: context,builder: (context) {
      return CupertinoAlertDialog(
        title: Text(t),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[

              Text(C),
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
              child: Text('OK'),
              onPressed:F
          ),
        ],
      );
    },);}
}