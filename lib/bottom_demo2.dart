/*
 * @Descripttion: 底部无规则
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 11:42:54
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-06 16:53:47
 * @FilePath: /guan_f/lib/bottom_demo2.dart
 */

import 'package:flutter/material.dart';
import 'each_view.dart';
import 'title.dart';

class bottomApp extends StatefulWidget {
  bottomApp({Key key}) : super(key: key);

  @override
  _bottomAppState createState() => _bottomAppState();
}

class _bottomAppState extends State<bottomApp> {
  final _bottomAppColor = Colors.blue;
  int _isActive = 0;
  List<Widget> listItem = [];
  // List<Widget> listItem = List();
  @override
  void initState() {
    listItem
      ..add(eachView('gxy'))
      ..add(eachView('xqq'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return title();
                },
                fullscreenDialog: true));
          },
          tooltip: 'xqq',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: listItem[_isActive],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: _bottomAppColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isActive = 0;
                    });
                  },
                  color: Colors.white,
                  icon: Icon(Icons.home)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      _isActive = 1;
                    });
                  },
                  color: Colors.white,
                  icon: Icon(Icons.add)),
            ],
          ),
        ));
  }
}




// 小demo

// import 'package:flutter/material.dart';

// import 'bottom_demo1.dart';

// void main(List<String> args) {
//   runApp(myApp());
// }

// class myApp extends StatelessWidget {
//   const myApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'guan',
//       debugShowCheckedModeBanner: false,
//       home: bottomApp(),
//     );
//   }
// }
