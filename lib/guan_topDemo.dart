/*
 * @Descripttion:
 * @version:
 * @Author: guanxiaoxin
 * @Date: 2022-01-07 16:52:22
 * @LastEditors: guanxiaoxin
 * @LastEditTime: 2022-01-13 11:35:52
 * @FilePath: /guan_f/lib/guan_topDemo.dart
 */

import 'package:flutter/material.dart';
import 'common/app_colors.dart';
import 'common/app_text.dart';

const recent = ["1112", "1222"];
const search = ["gxy", "xqq"];

class topDemo extends StatefulWidget {
  topDemo({Key key}) : super(key: key);
  List tabsb = ['guan', 'xqq'];
  TabController _controller;
  int _index = 0;

  @override
  _topDemoState createState() => _topDemoState();
}

class _topDemoState extends State<topDemo> with SingleTickerProviderStateMixin {
  List<Widget> guanlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    guanlist
      ..add(abc())
      ..add(bc());
    widget._controller = TabController(
        initialIndex: widget._index, length: widget.tabsb.length, vsync: this);
    widget._controller.addListener(() {
      setState(() {
        widget._index = widget._controller.index;
      });
      // print(widget._controller.index.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabBar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: searchBae(),
              );
            },
            icon: Icon(Icons.search),
          )
        ],
        bottom: TabBar(
          controller: widget._controller,
          tabs: widget.tabsb
              .map(
                (e) => Tab(
                  text: e,
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: widget._controller,
        children: guanlist,
      ),
      // guanlist[widget._index],
    );
  }
}

class abc extends StatelessWidget {
  const abc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return MyHomePage('123');
                },
                fullscreenDialog: true));
          },
          icon: Icon(Icons.home),
        ),
      ),
    );
  }
}

class bc extends StatelessWidget {
  const bc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: HomepageState(),
        // child: customguan(Icon(Icons.add), ''),
      ),
    );
  }
}

/* 新写的一个组件 */

class customguan extends StatefulWidget {
  final IconData iconData;
  final String title;
  final GestureTapCallback onguanTap;
  // List gu =  const [];
  customguan({Key key, this.iconData, this.title, this.onguanTap})
      : super(key: key);

  @override
  _customguanState createState() => _customguanState();
}

class _customguanState extends State<customguan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onguanTap,
      child: Column(
        children: [
          Icon(
            widget.iconData,
            size: 45.0,
          ),
          // widget.iconData,
          Text(
            widget.title == null ? "122" : widget.title,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          )
        ],
      ),
    );
  }
}

//在页面Widget中使用

class HomepageState extends StatefulWidget {
  HomepageState({Key key}) : super(key: key);
  String tips = '这里是提示';

  @override
  _HomepageStateState createState() => _HomepageStateState();
}

// keep-alive 缓存
class _HomepageStateState extends State<HomepageState>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组合Widget'),
      ),
      body: Container(
        child: buildCombinedWidget(),
      ),
    );
  }

  Widget buildCombinedWidget() {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              customguan(
                //使用自定义Widget
                iconData: Icons.home,
                title: '首页',
                onguanTap: () {
                  setState(() {
                    widget.tips = '点击了首页';
                  });
                },
              ),
              customguan(
                iconData: Icons.list,
                title: '产品',
                onguanTap: () {
                  setState(() {
                    widget.tips = '点击了产品';
                  });
                },
              ),
              customguan(
                iconData: Icons.more_horiz,
                title: '更多',
                onguanTap: () {
                  setState(() {
                    widget.tips = '点击了更多';
                    print('jjjjj');
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              widget.tips,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          Container(
              // padding: EdgeInsets.only(top: 50),
              width: 500.0,
              height: 200.0,
              child: LoadingView(
                child: Text('1111'),
                todoAfterError: (widget) {
                  print('11111');
                },
              ))
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_loading/common/app_colors.dart';
// import 'package:flutter_loading/common/app_text.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

///  Name: 页面加载Loading
///  Created by fitem on 2021/5/24 .
typedef OnTapCallback = Function(LoadingView widget);

// ignore: must_be_immutable
class LoadingView extends StatefulWidget {
  LoadingView({
    Key key,
    @required this.child, // 需要加载的Widget
    @required this.todoAfterError, // 错误点击重试
    @required this.todoAfterNetworkBlocked, // 网络错误点击重试
    this.networkBlockedDesc = "网络连接超时，请检查你的网络环境",
    this.errorDesc = "加载失败",
    this.loadingStatus = LoadingStatus.error,
  }) : super(key: key);

  // 需要加载的Widget
  final Widget child;

  // 接口错误加载重试
  final OnTapCallback todoAfterError;

  // 网络错误加载重试
  final OnTapCallback todoAfterNetworkBlocked;

  // 网络错误提示文案
  final String networkBlockedDesc;

  // 接口错误提示文案
  final String errorDesc;

  // 初始化记载状态
  LoadingStatus loadingStatus;
  _LoadingViewState _state;

  @override
  _LoadingViewState createState() {
    _state = _LoadingViewState();
    return _state;
  }

  /// 更新LoadingStatus
  void updateStatus(LoadingStatus status) {
    // 避免widget在build时setState()
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("updateStatus:$status");
      _state?.updateStatus(status);
    });
  }
}

class _LoadingViewState extends State<LoadingView> {
  /// 加载中 View
  Widget _buildLoadingView() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: SizedBox(
          height: 22.0,
          width: 22.0,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBgBlue),
          ),
        ),
      ),
    );
  }

  /// 编译通用页面
  Container _buildGeneralTapView({
    String url = "images/icon_network_blocked.png",
    String desc,
    @required Function onTap,
  }) {
    return Container(
      color: AppColors.primaryBgWhite,
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: SizedBox(
          height: 250.0,
          child: Column(
            children: [
              Image.asset(url, width: 140.0, height: 99.0),
              SizedBox(
                height: 40.0,
              ),
              Text(
                desc,
                style: AppText.gray50Text12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 30.0,
              ),
              if (onTap != null)
                BorderRedBtnWidget(
                  content: "重新加载",
                  onClick: onTap,
                  padding: 40.0,
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// 加载成功但数据为空 View
  Widget _buildLoadingSucButEmptyView() {
    return _buildGeneralTapView(
      url: "images/icon_empty.png",
      desc: "暂无数据",
      onTap: null,
    );
  }

  /// 网络加载错误页面
  Widget _buildNetworkBlockedView() {
    return _buildGeneralTapView(
        url: "images/icon_network_blocked.png",
        desc: widget.networkBlockedDesc,
        onTap: () {
          widget.todoAfterNetworkBlocked(widget);
        });
  }

  /// 加载错误页面
  Widget _buildErrorView() {
    return _buildGeneralTapView(
        url: "images/icon_error.png",
        desc: widget.errorDesc,
        onTap: () {
          widget.todoAfterError(widget);
        });
  }

  /// body by status
  Widget _buildBody() {
    switch (widget.loadingStatus) {
      case LoadingStatus.idle:
        return widget.child;
      case LoadingStatus.loading:
        return _buildLoadingView();
      case LoadingStatus.loading_suc:
        return widget.child;
      case LoadingStatus.loading_suc_but_empty:
        return _buildLoadingSucButEmptyView();
      case LoadingStatus.error:
        return _buildErrorView();
      case LoadingStatus.network_blocked:
        return _buildNetworkBlockedView();
    }
    return widget.child;
  }

  /// 更新LoadingStatus
  void updateStatus(LoadingStatus status) {
    setState(() {
      widget.loadingStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}

/// 状态枚举
enum LoadingStatus {
  idle, // 初始化
  loading, // 加载中
  loading_suc, // 加载成功
  loading_suc_but_empty, // 加载成功但是数据为空
  network_blocked, // 网络加载错误
  error, // 加载错误
}

///红色圆角边框 btn
class BorderRedBtnWidget extends StatelessWidget {
  const BorderRedBtnWidget({
    Key key,
    padding = 16,
    radius = 19.0,
    @required content,
    @required onClick,
  })  : _content = content,
        _padding = padding,
        _onClick = onClick,
        _radius = radius,
        super(key: key);

  final String _content;
  final double _padding;
  final Function _onClick;
  final double _radius; //圆角

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onClick,
      child: Text("$_content"),
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(AppText.blueText12),
          backgroundColor: MaterialStateProperty.all(AppColors.white),
          foregroundColor: MaterialStateProperty.all(AppColors.primaryTextBlue),
          side: MaterialStateProperty.all(
            BorderSide(
              color: AppColors.primaryBgBlue,
              width: 0.8,
            ),
          ),
          padding: MaterialStateProperty.all(
              EdgeInsets.only(left: _padding, right: _padding)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(_radius))))),
    );
  }
}

class searchBarDemo extends StatefulWidget {
  searchBarDemo({Key key}) : super(key: key);

  @override
  _searchBarDemoState createState() => _searchBarDemoState();
}

class _searchBarDemoState extends State<searchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}

class searchBae extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.delete),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recent
        : search.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  // List gu =  const [];
  MyHomePage(@required this.title, {Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Flutter
class _MyHomePageState extends State<MyHomePage> {
  double size = 200.0;

  void _changeSize() {
    setState(() {
      size = 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        color: Color(0xff0000ff),
        child: SizedBox(
          width: size,
          height: size,
          child: AndroidView(
            viewType: 'testView',
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _changeSize,
        child: new Icon(Icons.add),
      ),
    );
  }
}
