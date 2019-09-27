import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/comm_util.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fkb3_flutter/utils/sp_util.dart';
import 'login.dart';

class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GuideState();
  }
}

class GuideState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      PageView.custom(
          childrenDelegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
        var img = 'splash' + (index + 1).toString();
        return Container(
          child: Image.asset(
            CommUtil.getImgPath(img),
            fit: BoxFit.fill,
          ),
        );
      }, childCount: 5)),
      Center(
        child: Padding(
            child: Column(
              children: <Widget>[
                BtnPrimaryCorner(
                  S.of(context).useImmediately,
                  onPressed: () {
                    _dismissGuide();
                  },
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(50))),
      )
    ]);
  }

  void _dismissGuide() async {
    SpUtil.setAppEntered();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(), maintainState: false));
  }
}
