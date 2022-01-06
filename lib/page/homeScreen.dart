/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 11:08:47
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-06 11:11:50
 * @FilePath: /guan_f/lib/page/homeScreen.dart
 */
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(child: Text('home')),
    );
  }
}
