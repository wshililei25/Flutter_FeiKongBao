import 'sp_util.dart';
import 'constant.dart';
import 'package:fkb3_flutter/utils/db_util.dart';
import 'package:flutter/material.dart';
import 'package:fkb3_flutter/dialog/loading_dialog.dart';
import 'package:fkb3_flutter/main.dart';
import 'package:fkb3_flutter/page/login.dart';

class UserUtil {
  ///token不为空时表示已经登录
  ///已经登录返 回true否则返回false
  static bool isLogin() {
    return getUserToken().isNotEmpty;
  }

  ///获取用户token
  static String getUserToken() {
    String token = SpUtil.getString(Constant.keyToken);
    return token == null ? '' : token;
  }

  ///设置用户token
  static void setUserToken(String token) {
    SpUtil.putString(Constant.keyToken, token);
  }

  ///获取用户公司
  static String getLegalUnitID() {
    String legalUnitID = SpUtil.getString(Constant.keyLegalUnitID);
    return legalUnitID == null ? '' : legalUnitID;
  }

  ///设置用户公司
  static void setLegalUnitID(String legalUnitID) {
    SpUtil.putString(Constant.keyLegalUnitID, legalUnitID);
  }

  ///获取用户基地址
  static String getUserBaseUrl() {
    String url = SpUtil.getString(Constant.keyBaseUrl);
    return url == null ? '' : url;
  }

  ///设置用户基地址
  static void setUserBaseUrl(String url) {
    SpUtil.putString(Constant.keyBaseUrl, url);
  }

  ///用户退出
  static void logout(BuildContext context) async {
    setUserToken("");
    await DBUtil.clearData();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage(), maintainState: false));
  }
}
