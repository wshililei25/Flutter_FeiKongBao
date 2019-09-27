import 'package:fkb3_flutter/utils/api_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fkb3_flutter/bean/bean_simple_bill.dart';
import 'package:fkb3_flutter/utils/comm_util.dart';
import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:fkb3_flutter/widget/load_more_widget.dart';
import 'biz_list_factory.dart';
import 'package:fkb3_flutter/page/biz/biz_type.dart';
import 'biz_list_util.dart';
import 'package:fkb3_flutter/page/biz/biz_edit.dart';

class BillListUtil extends BizListFactory {
  @override
  List<Widget> buildBillListWidget(Map bizType) {
    List<Widget> _tabs = [];
    for (int i = 0; i < BizListUtil.billList.length; i++) {
      var widget = LoadMoreWidget(
        itemBuilder: _buildBillItemBuilder(bizType),
        onRefresh: _buildLoadBillListListener(bizType[BizType.simpleType],
            BizListUtil.billList[i][BizListUtil.tabStatus]),
        onLoadMore: _buildLoadBillListListener(bizType[BizType.simpleType],
            BizListUtil.billList[i][BizListUtil.tabStatus]),
      );
      _tabs.add(widget);
    }
    return _tabs;
  }

  OnLoadData _buildLoadBillListListener(String bizType, int bizStatus) {
    return (targetPage, targetPageSize) {
      return _loadBillData(bizType, bizStatus, targetPageSize, targetPage);
    };
  }

  Future<List<BeanSimpleBill>> _loadBillData(
      String bizType, int bizStatus, int pageSize, int page) async {
    List<BeanSimpleBill> bills =
        await ApiManager.loadBizList(bizType, bizStatus, pageSize, page);
    return bills;
  }

  ItemBuilder _buildBillItemBuilder(Map bizType) {
    /*
    //带图标的样式
    return (context, index, itemData) {
      BeanSimpleBill bill = itemData;
      return ContainerBottomLine(
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLeft(bizType),
                _buildMiddle(bizType, bill),
                _buildRight(bizType, bill)
              ],
            ),
          ));*/

    //不带图标的样式
    return (context, index, itemData) {
      BeanSimpleBill bill = itemData;
      return ContainerBottomLine(
          child: InkWell(
        onTap: () {
          _onItemClick(context, bill, bizType);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            _buildStatus(bizType, bill),
            _buildBody(bizType, bill),
          ],
        ),
      ));
    };
  }

  _onItemClick(BuildContext context, BeanSimpleBill bill, Map bizType) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BizEditPage(bizType, bill),
        maintainState: false));
  }

  /*
  //带图标的样式
  Widget _buildLeft(Map bizType) {
    return Padding(
      child: ImageLarge.asset(bizType[BizType.icon]),
      padding: EdgeInsets.fromLTRB(0, 0, H.iconToText, 0),
    );
  }

  Widget _buildMiddle(Map bizType, BeanSimpleBill bill) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextSecondContent(bill.bizCD),
          Padding(
            padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
            child: TextBlackContent(
              "在地地要要 地要在地 要有一上上上工以上是瞳要一",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: C.textContentThird,
                  size: H.iconTip,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(H.textToText, 0, 0, 0),
                  child: TextThirdTip(bill.creatDateStr),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "CNY",
                  style: TextStyle(
                      color: C.textContent,
                      fontSize: TextSize.content,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " -2.089",
                  style: TextStyle(
                      color: C.textContent,
                      fontSize: TextSize.appbar,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRight(Map bizType, BeanSimpleBill bill) {
    return Padding(
      child: Offstage(
        offstage:
            bill.lastStatusDesc == null || bill.lastStatusDesc.length == 0,
        child: Row(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(H.iconToTextMin),
              width: ScreenUtil().setHeight(H.iconToTextMin),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(CommUtil.getColorFromHex(bill.billStatusColor))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(H.iconToTextMin), 0, 0, 0),
              child: TextSecondContent(bill.lastStatusDesc),
            )
          ],
        ),
      ),
      padding: EdgeInsets.fromLTRB(H.iconToTextMin, 0, 0, 0),
    );
  }*/

  //不带图标的样式
  Widget _buildStatus(Map bizType, BeanSimpleBill bill) {
    return Offstage(
      offstage: bill.lastStatusDesc == null || bill.lastStatusDesc.length == 0,
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(H.iconToTextMin),
            width: ScreenUtil().setHeight(H.iconToTextMin),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(CommUtil.getColorFromHex(bill.billStatusColor))),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(H.iconToTextMin), 0, 0, 0),
            child: TextSecondContent(bill.lastStatusDesc),
          )
        ],
      ),
    );
  }

  Widget _buildBody(Map bizType, BeanSimpleBill bill) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextSecondContent(bill.bizCD),
          Padding(
            padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
            child: TextBlackContent(
              bill.expenseClaimReason,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: C.textContentThird,
                  size: H.iconTip,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(H.textToText, 0, 0, 0),
                  child: TextThirdTip(bill.creatDateStr),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "CNY",
                  style: TextStyle(
                      color: C.textContent,
                      fontSize: TextSize.content,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  " -2.089",
                  style: TextStyle(
                      color: C.textContent,
                      fontSize: TextSize.appbar,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //老式的列表样式
  ItemBuilder _buildBillItemBuilderOld(Map bizType) {
    return (context, index, itemData) {
      BeanSimpleBill bill = itemData;
      return BillItemLayout(
        icon: bizType[BizType.icon],
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    TextBlackTitle(bizType[BizType.fullName]),
                    Text(
                      "--${bill.lastStatusDesc}",
                      style: TextStyle(
                          fontSize: TextSize.tip,
                          color: Color(
                              CommUtil.getColorFromHex(bill.billStatusColor))),
                    )
                  ],
                ),
                Padding(
                  child: TextBlackSecondTip(bill.creatDateStr),
                  padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
                ),
                Padding(
                  child: TextBlackSecondTip(bill.bizCD),
                  padding: EdgeInsets.fromLTRB(0, H.textToText, 0, 0),
                ),
              ],
            ),
            Align(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: ScreenUtil().setWidth(120)),
                child: TextBlackSecondTip(
                  bill.expenseClaimReason,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
      );
    };
  }
}
