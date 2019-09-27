import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/page/biz/list/biz_list_factory.dart';

class BizListUtil {
  static const String tabText = "tabText";
  static const String tabStatus = "tabStatus";
  static var billList = <Map>[];
  static var bizListFactories = <String, BizListFactory>{};

  static init(BuildContext context) {
    billList.add({tabText: S.of(context).submitted, tabStatus: 2});
    billList.add({tabText: S.of(context).unSubmitted, tabStatus: 1});
  }

  static registerFactory(String bizType, BizListFactory factory) {
    bizListFactories[bizType] = factory;
  }

  static BizListFactory getFactory(String serviceName) {
    return bizListFactories[serviceName];
  }

  static List<Widget> buildBizListTabs(int currentIndex, List<Map> tab) {
    List<Widget> _tabs = [];
    for (int i = 0; i < tab.length; i++) {
      if (i == currentIndex) {
        _tabs.add(new Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageSmall.asset("icon_blue_tab"),
              Padding(
                padding: EdgeInsets.fromLTRB(M.item, 0, 0, 0),
                child: TextPrimaryTitle(tab[i][tabText]),
              )
            ],
          ),
        ));
      } else {
        _tabs.add(new Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageSmall.asset("icon_gray_tab"),
              Padding(
                padding: EdgeInsets.fromLTRB(M.item, 0, 0, 0),
                child: TextThirdTitle(tab[i][tabText]),
              )
            ],
          ),
        ));
      }
    }
    return _tabs;
  }
}
