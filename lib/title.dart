/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 16:47:40
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-06 17:46:32
 * @FilePath: /guan_f/lib/title.dart
 */

import 'package:flutter/material.dart';

class title extends StatefulWidget {
  title({Key key}) : super(key: key);

  @override
  _titleState createState() => _titleState();
}

class _titleState extends State<title> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
              child: Text(
                '完善个人信息',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Center(
            child: Text('完善信息，方便他人快速找到你',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
            child: Text(
              '基本信息',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(45.0, 10.0, 10.0, 0.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "请填写真实姓名",
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(45.0, 10.0, 10.0, 0.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "请输入手机号",
              ),
              obscureText: true,
            ),
          ),

          // Text('data'),
          // Text('data'),
          // Text('data'),
        ],
      ),
    );
  }
}
