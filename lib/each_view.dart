/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 13:56:24
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-06 15:14:03
 * @FilePath: /guan_f/lib/each_view.dart
 */
import 'package:flutter/material.dart';

class eachView extends StatefulWidget {
  String _title;
  eachView(@required this._title, {Key key}) : super(key: key);
  @override
  _eachViewState createState() => _eachViewState();
}

class _eachViewState extends State<eachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Text(widget._title),
    );
  }
}
