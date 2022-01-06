/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 10:29:09
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-06 11:52:41
 * @FilePath: /guan_f/lib/bottom_demo.dart
 */

import 'package:flutter/material.dart';
import './page/homeScreen.dart';
import './page/inboxScreen.dart';

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
      ..add(homeScreen())
      ..add(inboxScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'xqq',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: listItem[_isActive],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => setState(() {
            _isActive = value;
          }),
          currentIndex: _isActive,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              activeIcon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                label: 'inbox',
                activeIcon: Icon(Icons.inbox_outlined)),
          ],
        ));
  }
}

// 小demo

// import 'package:flutter/material.dart';

// import 'bottom_demo.dart';

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
