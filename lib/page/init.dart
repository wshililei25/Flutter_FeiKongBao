import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/comm_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fkb3_flutter/utils/sp_util.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:fkb3_flutter/utils/db_util.dart';
import 'package:fkb3_flutter/utils/user_util.dart';
import 'home.dart';
import 'guide.dart';
import 'login.dart';
import 'biz/biz_type.dart';
import 'package:fkb3_flutter/page/biz/list/biz_list_util.dart';
import 'package:fkb3_flutter/page/biz/list/bill_list_util.dart';
import 'biz/edit/biz_edit_factory.dart';

class InitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitState();
  }
}

class InitState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    _initAfterState();
    return _getPage();
  }

  Widget _getPage() {
    return Container(
      child: Image.asset(
        CommUtil.getImgPath("launcher"),
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _entryApp() {
    bool entered = SpUtil.isAppEntered();
    bool isLogin = UserUtil.isLogin();
    if (entered) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(), maintainState: false));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginPage(), maintainState: false));
      }
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => GuidePage(), maintainState: false));
    }
  }

  void _initAsync() async {
    //初始化SP
    // 当前方法的代码会停在await的这行
    // 然后退出方法继续执行
    // 当方法外面的内容全部执行完了再回到这里执行
    await SpUtil.getInstance();
    //初始化数据库
    await DBUtil.initDatabase();
    //异步初始化完成后进入APP
    _entryApp();
  }

  void _initAfterState() {
    //初始化屏幕适配
    ScreenUtil.instance =
        ScreenUtil(width: Constant.designWidth, height: Constant.designHeight)
          ..init(context);
    BizListUtil.init(context);
    BizListUtil.registerFactory(BizType.service_bill, BillListUtil());
    BizType.init(context);
    ElementType.init();
  }
}
