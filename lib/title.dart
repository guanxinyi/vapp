/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-06 16:47:40
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-13 11:20:39
 * @FilePath: /guan_f/lib/title.dart
 */

import 'package:flutter/material.dart';
import 'input.dart';
import 'guan_topDemo.dart';

Widget _buildItemRow(String label, Widget itemWidget,
    {bool must = true, Key key}) {
  final labelStyle = TextStyle(fontSize: 15.0, color: Color(0xff888888));
  Widget txt;
  if (must) {
    txt = Text.rich(
      TextSpan(
        children: [
          TextSpan(text: label),
          TextSpan(text: ' *', style: labelStyle.copyWith(color: Colors.red)),
        ],
        style: labelStyle,
      ),
    );
  } else {
    txt = Text(label, style: labelStyle);
  }
  return Container(
    key: key,
    margin: EdgeInsets.only(bottom: 2.0, top: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: 80.0,
          height: 80.0,
          alignment: Alignment.centerLeft,
          child: txt,
        ),
        itemWidget,
      ],
    ),
  );
}

class _RowSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Divider(height: 1, color: Colors.grey),
    );
  }
}

class title extends StatefulWidget {
  title({Key key}) : super(key: key);

  @override
  _titleState createState() => _titleState();
}

class _titleState extends State<title> with SingleTickerProviderStateMixin {
  TextEditingController emailInputController;
  TextEditingController guanInputController;
  final emailFocusNode = FocusNode();
  final guanFocusNode = FocusNode();

  List<Widget> _tabs;
  List<String> tabas = ['ios', 'aa'];
  TabController _tabController;

  @override
  void initState() {
    emailInputController = TextEditingController();
    guanInputController = TextEditingController();
    _tabController = TabController(length: tabas.length, vsync: this);
    _tabs
      ..add(inputDemoGuan('ios'))
      ..add(MyHomePage());
    // ..add(guan('ando'));
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        print('object');
      }
      if (!emailFocusNode.hasFocus) print('email');
    });
    guanFocusNode.addListener(() {
      if (!guanFocusNode.hasFocus) print('guan');
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('滑动'),
      // bottom: TabBar(
      //     // tabs: tabas
      //     //     .map(
      //     //       (e) => Tab(
      //     //         text: e,
      //     //       ),
      //     //     )
      //     //     .toList(),
      //     // controller: _tabController,
      //     ),
      // ),
      body: Text('1'),
    );
  }
}

class InputDemo extends StatefulWidget {
  InputDemo({Key key}) : super(key: key);

  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  //进来是
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextField(
            controller: _controller,
            // onChanged: (value) => print(value),
          ),
          SizedBox(
            height: 16.0,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('tijiao'),
          )
        ],
      ),
    );
  }
}

class inputDemoGuan extends StatelessWidget {
  const inputDemoGuan(String abc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildItemRow(
          '城市',
          FRimlessInput(
            // controller: emailInputController,
            borderColor: Color.fromARGB(255, 233, 35, 35),
            // height: 60.0,
            // enabled: false,
            hintText: "请输入你的邮箱",
            maxLength: 20,
            // fillColor: Colors.grey[100],
            // focusNode: emailFocusNode,
            onChanged: (val) => print(val),
            // inputFormatters: [
            //   PageInputFormatters.multipleAccount,
            // ],
          ),
        ),
        _RowSeparator(),
        _buildItemRow(
          '输入',
          FRimlessInput(
            // controller: guanInputController,
            height: 60.0,
            hintText: "请输入你的手机号",
            maxLength: 20,
            // focusNode: guanFocusNode,
            onChanged: (val) => print(val),
            // inputFormatters: [
            //   PageInputFormatters.multipleAccount,
            // ],
          ),
        ),
        _RowSeparator(),
        // Center(
        //   child: Container(
        //     margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
        //     child: Text(
        //       '完善个人信息',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 25.0,
        //         fontWeight: FontWeight.w700,
        //       ),
        //     ),
        //   ),
        // ),
        // Center(
        //   child: Text('完善信息，方便他人快速找到你',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 16.0,
        //         fontWeight: FontWeight.w400,
        //       )),
        // ),
        // Container(
        //   alignment: Alignment.topLeft,
        //   margin: EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
        //   child: Text(
        //     '基本信息',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 18.0,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        // Container(
        //   alignment: Alignment.topLeft,
        //   margin: EdgeInsets.fromLTRB(45.0, 10.0, 10.0, 0.0),
        //   child: TextField(
        //     textAlign: TextAlign.center,
        //     decoration: InputDecoration(
        //       hintText: "请填写真实姓名",
        //     ),
        //   ),
        // ),
        // alignment: Alignment.topLeft,
        // margin: EdgeInsets.fromLTRB(45.0, 10.0, 1r0.0, 0.0),

        // FRimless
        // Text('data'),
        // Text('data'),
        // Text('data'),
      ],
    );
  }
}

/* 新 */
class guan extends StatelessWidget {
  const guan(String abc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('data'),
    );
  }
}
