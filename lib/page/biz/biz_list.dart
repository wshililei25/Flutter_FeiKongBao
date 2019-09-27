import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:fkb3_flutter/page/biz/list/biz_list_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'biz_type.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'biz_edit.dart';

class BizListPage extends StatefulWidget {
  final Map<String, String> bizType;

  BizListPage(this.bizType);

  @override
  State<StatefulWidget> createState() => BizListState();
}

class BizListState extends State<BizListPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _buildTabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWhiteAppbar(widget.bizType[BizType.fullName]),
      ),
      body: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: C.background,
              child: TabBarView(
                controller: _tabController,
                children:
                    BizListUtil.getFactory(widget.bizType[BizType.service])
                        .buildBillListWidget(widget.bizType),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: C.contentBackground,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0.0, H.shadow),
                    color: C.shadow,
                    blurRadius: R.shadow,
                  )
                ]),
            child: TabBar(
                controller: _tabController,
                indicatorColor: C.primary,
                indicatorWeight: ScreenUtil().setHeight(H.tabIndicator),
                labelColor: C.primary,
                unselectedLabelColor: C.textHintColor,
                tabs: BizListUtil.buildBizListTabs(
                    _tabController.index, BizListUtil.billList)),
          ),
        ],
      ),
/* 老样式中的底部添加按钮
     bottomNavigationBar: Container(
        decoration:
            BoxDecoration(color: C.contentBackground, boxShadow: <BoxShadow>[
          BoxShadow(
            color: C.shadow,
            blurRadius: R.shadow,
            offset: Offset(0.0, -H.shadow),
          ),
        ]),
        height: H.titleBar,
        child: Center(
          child: TextPrimaryBtn("+ ${widget.bizType[BizType.simpleName]}"),
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _clickFloatingButton();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _clickFloatingButton() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BizEditPage(widget.bizType, null),
        maintainState: false));
  }

  _buildTabController() {
    _tabController = new TabController(initialIndex: 0, vsync: this, length: 2);
    _tabController.addListener(() {
      if (_tabController.index != _tabController.previousIndex) {
        setState(() {});
      }
    });
  }
}
