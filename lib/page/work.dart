import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:fkb3_flutter/utils/db_util.dart';
import 'package:fkb3_flutter/bean/bean_employee.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/bean/bean_menu.dart';
import 'package:fkb3_flutter/page/biz/biz_list.dart';
import 'biz/biz_type.dart';
import 'package:fkb3_flutter/utils/toast.dart';
import 'package:fkb3_flutter/page/biz/list/biz_list_util.dart';

class WorkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkState();
  }
}

class WorkState extends State<WorkPage> {
  ScrollController _controller;
  bool isClosed = false;
  BeanEmployee _employee;
  List<MenuHolder> _holderList = [];
  int itemCount = 3;
  int itemCount2 = 4;
  int howManyItemDisplayItemCount2 = 1; //有多少行显示itemCount2个（即有一行显示4个）

  _initData() async {
    _employee = await DBUtil.queryEmployee();
    List<BeanMenu> menus = await DBUtil.queryMenus();
    if (menus != null && menus.isNotEmpty) {
      MenuHolder holder;

      List<BeanMenu> holderMenuList;
      String groupId;

      for (int i = 0; i < menus.length; i++) {
        String current = menus[i].groupCode;
        if (i == 0) {
          //第一行
          holderMenuList = List();
          holder = MenuHolder(holderMenuList, null);
          _holderList.add(holder);
          groupId = current;
        } else if (groupId == null || groupId != current) {
          //新的组
          _fillMenu(holderMenuList);
          holderMenuList = List();
          MenuHolder titleHolder = MenuHolder(null, menus[i].groupName);
          holder = MenuHolder(holderMenuList, null);
          _holderList.add(titleHolder);
          _holderList.add(holder);
          groupId = current;
        } else if ((_holderList.length <= howManyItemDisplayItemCount2 &&
                holderMenuList.length == itemCount2) ||
            (holderMenuList.length == itemCount &&
                _holderList.length > howManyItemDisplayItemCount2)) {
          //当前行显示满了后要换一行显示(分显示itemCount和itemCount2个数的行)
          holderMenuList = List();
          holder = MenuHolder(holderMenuList, menus[i].groupName);
          _holderList.add(holder);
          groupId = current;
        }
        holderMenuList.add(menus[i]);
        if (menus.length - 1 == i) {
          //最后一条的时候
          _fillMenu(holderMenuList);
        }
      }
    }
    setState(() {});
  }

  //补齐元素
  void _fillMenu(List<BeanMenu> list) {
    int count = 0;
    int length = list.length;
    if (_holderList.length > howManyItemDisplayItemCount2 &&
        list.length < itemCount) {
      //不足行的时候，要补齐3个(itemCount)
      count = itemCount;
    } else if (_holderList.length <= howManyItemDisplayItemCount2 &&
        list.length < itemCount2) {
      //不足行的时候，要补齐4个(itemCount2)
      count = itemCount2;
    }
    for (int j = 0; j < count - length; j++) {
      list.add(BeanMenu());
    }
  }

  @override
  void initState() {
    super.initState();
    _initData();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset == _controller.position.maxScrollExtent &&
          !isClosed) {
        setState(() {
          isClosed = true;
        });
      } else if (isClosed) {
        setState(() {
          isClosed = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: C.primary,
        elevation: 0,
        title: _buildTitleBar(),
      ),
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              titleSpacing: 0.0,
              pinned: false,
              floating: false,
              expandedHeight: ScreenUtil().setHeight(100),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  color: C.primary,
                  height: double.infinity,
                  child: Center(
                    child: _buildTop(),
                  ),
                ),
              ),
            )
          ];
        },
        body: ListView.builder(
          itemCount: _holderList.length,
          itemBuilder: (context, index) {
            return _buildBodyItem(context, index);
          },
        ),
      ),
    );
  }

  //滑动到顶部时的top
  Widget _buildTitleBar() {
    if (isClosed) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, M.screen, 0),
              child: ImageSmall.asset("icon_scan"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, M.screen, 0),
              child: ImageSmall.asset("icon_add_expense"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, M.screen, 0),
              child: ImageSmall.asset("icon_reimburse"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, M.screen, 0),
              child: ImageSmall.asset("icon_apply"),
            )
          ]);
    } else if (_employee != null) {
      return TextWhiteAppbar(_employee.companyName);
    } else {
      return Text("");
    }
  }

//滑动区域
  Widget _buildBodyItem(BuildContext context, int index) {
    MenuHolder holder = _holderList[index];
    if (holder.menus == null) {
      return Container(
        child: TextBlackTitle(holder.title),
        color: C.background,
        padding: EdgeInsets.fromLTRB(M.screen, M.item, M.screen, M.item),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, M.item, 0, M.item),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildItemMenu(context, holder.menus),
        ),
      );
    }
  }

  List<Widget> _buildItemMenu(BuildContext context, List<BeanMenu> menus) {
    List<Widget> widgets = [];
    menus.forEach((menu) {
      var widget;
      if (menu == null || menu.code == null) {
        widget = Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
              )
            ],
          ),
        );
      } else {
        widget = Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              _transferMenu(menu);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageNormal.network(menu.icon),
                Padding(
                  child: TextBlackContent(menu.iconName),
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenUtil().setHeight(M.item), 0, 0),
                )
              ],
            ),
          ),
        );
      }

      widgets.add(widget);
    });
    return widgets;
  }

  //顶部可滑动部分
  Widget _buildTop() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageNormal.asset("icon_scan"),
              Padding(
                child: TextWhiteTitle(S.of(context).scan),
                padding: EdgeInsets.fromLTRB(
                    0, ScreenUtil().setHeight(M.item), 0, 0),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageNormal.asset("icon_add_expense"),
              Padding(
                child: TextWhiteTitle(S.of(context).addExpense),
                padding: EdgeInsets.fromLTRB(
                    0, ScreenUtil().setHeight(M.item), 0, 0),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageNormal.asset("icon_reimburse"),
              Padding(
                child: TextWhiteTitle(S.of(context).reimburse),
                padding: EdgeInsets.fromLTRB(
                    0, ScreenUtil().setHeight(M.item), 0, 0),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageNormal.asset("icon_apply"),
              Padding(
                child: TextWhiteTitle(S.of(context).apply),
                padding: EdgeInsets.fromLTRB(
                    0, ScreenUtil().setHeight(M.item), 0, 0),
              )
            ],
          )
        ]);
  }

  _transferMenu(BeanMenu menu) {
    var bizType = BizType.getTypeByMenuCode(menu.code);
    if (bizType != null) {
      if (BizListUtil.getFactory(bizType[BizType.service]) == null) {
        Toast.show(context: context, msg: "${menu.iconName} 未注册列表服务......");
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BizListPage(bizType), maintainState: false));
      }
    } else {
      Toast.show(context: context, msg: "${menu.iconName} 正在开发中，敬请期待......");
    }
  }
}

class MenuHolder {
  List<BeanMenu> menus;
  String title;

  MenuHolder(this.menus, this.title);
}
