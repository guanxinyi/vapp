/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2021-12-29 14:21:06
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2021-12-29 17:19:34
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
          var result = await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return menu();
            },
            settings: RouteSettings(),
            maintainState: false,
            fullscreenDialog: false,
          ));
          print(result);
        },
        child: Text('提交'),
      ),
    );
  }
}

class menu extends StatelessWidget {
  const menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('菜单'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('gxyhhhhhh');
              },
              child: Text('返回'))
        ],
      ),
    );
  }
}
