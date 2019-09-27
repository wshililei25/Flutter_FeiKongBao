import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/api_manager.dart';
import 'package:fkb3_flutter/bean/bean_response_login.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/utils/comm_util.dart';
import 'package:fkb3_flutter/utils/db_util.dart';
import 'package:fkb3_flutter/utils/user_util.dart';
import 'package:fkb3_flutter/utils/toast.dart';
import 'package:fkb3_flutter/main.dart';
import 'home.dart';
import 'package:fkb3_flutter/dialog/loading_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State {
  String _phone;
  String _pwd;
  bool _isLegal = false;

  void _onTextChange() {
    _isLegal =
        _phone != null && _phone.isNotEmpty && _pwd != null && _pwd.isNotEmpty;
  }

  void login() async {
    //TODO 获取基地址，暂时写死
    UserUtil.setUserBaseUrl("http://prodevapi.feikongbao.net");

    BeanResponseLogin resp = await ApiManager.login(
        context, "flutter is the best!", "", _phone, _pwd);

    if (resp == null) return;
    //保存登录的用户信息
    int value = await DBUtil.insertLoginData(resp);

    if (value == 0) {
      Toast.show(context: context, msg: S.of(context).loginError);
    } else if (value < 0) {
      Toast.show(context: context, msg: S.of(context).loadMenuError);
    } else {
      //登录成功后设置token
      UserUtil.setUserToken(resp.token);
      DBUtil.loadStaticData(context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(), maintainState: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(60, 80, 60, 20),
            child: Image.asset(
              CommUtil.getImgPath("logo"),
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            S.of(context).login,
            style: TextStyle(color: C.primary, fontSize: TextSize.bigTitle),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: C.divider),
                    bottom: BorderSide(color: C.divider))),
            margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Icon(Icons.phone_iphone),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      onChanged: (text) {
                        _phone = text;
                        setState(() {
                          _onTextChange();
                        });
                      },
                      keyboardType: TextInputType.phone,
                      style: TextBlackTitleStyle(),
                      decoration: InputDecoration(
                          labelText: S.of(context).inputMobile,
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: C.divider),
                    bottom: BorderSide(color: C.divider))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Icon(Icons.lock),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      onChanged: (text) {
                        _pwd = text;
                        setState(() {
                          _onTextChange();
                        });
                      },
                      obscureText: true,
                      style: TextBlackTitleStyle(),
                      decoration: InputDecoration(
                          labelText: S.of(context).inputPassword,
                          border: InputBorder.none),
                    ),
                  ),
                  TextPrimaryTip(
                    S.of(context).forgotPassword,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: BtnPrimaryCorner(
                  S.of(context).login,
                  onPressed: _isLegal
                      ? () {
                          login();
                        }
                      : null,
                ),
                margin: EdgeInsets.all(M.screen),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
