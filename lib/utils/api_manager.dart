import 'http_util.dart';
import 'package:flutter/material.dart';
import 'package:fkb3_flutter/bean/bean_request_login.dart';
import 'package:fkb3_flutter/bean/bean_request_head.dart';
import 'package:fkb3_flutter/dialog/loading_dialog.dart';
import 'package:fkb3_flutter/bean/bean_response_login.dart';
import 'package:fkb3_flutter/bean/bean_response.dart';
import 'package:fkb3_flutter/utils/toast.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/utils/user_util.dart';
import 'package:fkb3_flutter/bean/bean_static_data.dart';
import 'package:fkb3_flutter/bean/bean_response_template_url.dart';
import 'log_util.dart';
import 'package:fkb3_flutter/bean/bean_request_bill_list.dart';
import 'package:fkb3_flutter/bean/bean_simple_bill.dart';

class ApiManager {
  ///登录
  static Future<BeanResponseLogin> login(BuildContext context,
      String deviceToken, String legalUnitID, String phone, String pws) async {
    BeanRequestLogin login = new BeanRequestLogin(deviceToken, legalUnitID);
    BeanRequestHead head = BeanRequestHead(uid: phone, pws: pws);
    var url = "${UserUtil.getUserBaseUrl()}/api/Account/LoginAccount";

    var data = await _doPostJson(url, login, head: head, context: context);
    if (data == null) {
      return null;
    } else {
      BeanResponseLogin entity = BeanResponseLogin.fromJson(data);
      return entity;
    }
  }

  ///基础数据
  static Future<List> loadStaticData({BuildContext context}) async {
    var url = "${UserUtil.getUserBaseUrl()}/api/BaseData/GetAllBaseData";

    var data = await _doPostJson(url, "", context: context);
    if (data == null) {
      return null;
    } else {
      List dataList = List();
      data.forEach((item) {
        BeanStaticData staticData = BeanStaticData.fromJson(item);
        dataList.add(staticData);
      });
      return dataList;
    }
  }

  ///加载所有单据模板地址
  static Future loadAllBillTemplate({BuildContext context}) async {
    var url = "${UserUtil.getUserBaseUrl()}/api/DynamicTemplate/GetTemplates";

    var data = await _doPostJson(url, "", context: context);
    if (data == null) {
      return null;
    } else {
      List dataList = List();
      data.forEach((item) {
        BeanResponseTemplateUrl staticData =
            BeanResponseTemplateUrl.fromJson(item);
        dataList.add(staticData);
      });
      return dataList;
    }
  }

  ///加载单据列表
  static Future<List<BeanSimpleBill>> loadBizList(
      String bizType, int bizStatus, int pageSize, int page,
      {BuildContext context}) async {
    var url = "${UserUtil.getUserBaseUrl()}/api/Expense/DownloadBizListPage";
    BeanRequestBillList request = BeanRequestBillList();
    request.bizType = bizType;
    request.bizStatus = bizStatus;
    request.pageSize = pageSize;
    request.page = page;
    var data = await _doPostJson(url, request, context: context);
    if (data == null) {
      return null;
    } else {
      List<BeanSimpleBill> dataList = [];
      data.forEach((item) {
        BeanSimpleBill staticData = BeanSimpleBill.fromJson(item);
        dataList.add(staticData);
      });
      return dataList;
    }
  }

  static Future _doPostJson(String url, Object content,
      {BuildContext context, BeanRequestHead head}) async {
    ///1.弹出loading
    if (context != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingDialog();
          });
    }

    ///2.请求接口
    var data;
    data = await HttpUtil.doPostJson(url, content, head: head);

    ///3.接口返回后关闭loading
    if (context != null) {
      Navigator.of(context).pop();
    }

    ///4.处理结果
    if (data == null) {
      return null;
    } else {
      var result = _processResult(data, context: context);
      return result;
    }
  }

  static dynamic _processResult(data, {BuildContext context}) {
    Log.v(data.runtimeType.toString());
    BeanResponse responseData = BeanResponse.fromJson(data);
    if (responseData != null && responseData.head != null) {
      if (responseData.head.ret == 0) {
        return responseData.content;
      } else if (responseData.head.msg != null &&
          responseData.head.msg.isNotEmpty &&
          context != null) {
        Toast.show(context: context, msg: responseData.head.msg);
      } else if (context != null) {
        Toast.show(context: context, msg: S.of(context).serverError);
      }
    } else if (context != null) {
      Toast.show(context: context, msg: S.of(context).networkError);
    }
  }
}
