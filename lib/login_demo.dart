/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2021-12-29 14:21:06
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2021-12-30 15:12:28
 * @FilePath: /guan_f/lib/login_demo.dart
 */

import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: ElevatedButton(
        onPressed: () async {
          Navigator.of(context).pushNamed('menu', arguments: "gxy");
          // var result = await Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) {
          //     return menu();
          //   },
          //   settings: RouteSettings(
          //     arguments: "11123wwww",
          //   ),
          //   maintainState: false,
          //   fullscreenDialog: false,
          // ));
          // print(result);
        },
        child: Text('提交'),
      ),
    );
  }
}

class menu extends StatelessWidget {
  // final String title;
  // const menu({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dynamic a = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(a),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('返回'))
        ],
      ),
    );
  }
}
