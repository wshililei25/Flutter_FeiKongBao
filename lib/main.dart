import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'page/init.dart';
// TODO: 获取设备信息。

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //国际化的东西需要在最开始的时候这里设置，放在initPage里面会导致那个页面取string的值的时候报错
    return MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Fkb3',
        home: Scaffold(
          body: InitPage(),
          resizeToAvoidBottomPadding:
          false, // This trailing comma makes auto-formatting nicer for build methods.
        ),
    );
  }
}