/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 11:08:47
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-06 11:12:53
 * @FilePath: /guan_f/lib/page/inboxScreen.dart
 */
import 'package:flutter/material.dart';

class inboxScreen extends StatelessWidget {
  const inboxScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inbox'),
      ),
      body: Center(child: Text('inbox')),
    );
  }
}
