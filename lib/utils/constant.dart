import 'dart:ui' as ui show window;
import 'package:flutter/material.dart';

class Constant {
  static final String keyEntered = 'keyEntered';
  static final String keyToken = 'keyToken';
  static final String keyLegalUnitID = 'keyLegalUnitID';
  static final String keyBaseUrl = 'keyBaseUrl';

  ///数据库名称
  static final String databaseName = 'fkb.db';

  ///设计图尺寸
  static final double designWidth = 375;
  static final double designHeight = 667;
  static final double designRatio = ui.window.physicalSize.width / designWidth;
}

class C {
  ///主色
  static final Color primary = Color(0xFF0F9AEF);

  ///主色
  static final Color transparent = Color(0x00000000);

  ///背景：主背景
  static final Color background = Color(0xFFF5F5F5);

  ///背景：内容背景
  static final Color contentBackground = Color(0xFFFFFFFF);

  ///线条：按钮描边
  static final Color buttonBorder = Color(0xFFEEEEEE);

  ///线条：间隔线
  static final Color divider = Color(0xFFEEEEEE);

  ///阴影颜色
  static final Color shadow = Color(0x1F000000);

  ///箭头
  static final Color arrow = Color(0xFFF3F4F5);

  ///文字：一级正文
  static final Color textContent = Color(0xFF333333);

  ///文字：二级正文
  static final Color textContentSecond = Color(0xFF666666);

  ///文字：三级正文
  static final Color textContentThird = Color(0xFF999999);

  ///文字：描述、占位文字
  static final Color textHintColor = Color(0xFFCCCCCC);

  ///文字：文字按钮、链接、公告等蓝色
  static final Color textButton = Color(0xFF0F9AEF);

  ///文字：通过状态等
  static final Color textGreen = Color(0xFF52C41A);

  ///文字：处理中、审批中等
  static final Color textOrange = Color(0xFFF5A623);

  ///文字：审批拒绝等
  static final Color textRed = Color(0xFFF5222D);

  ///文字：白色
  static final Color textWhite = Color(0xFFFFFFFF);
}

class TextSize {
  ///标题：大标题
  static final double bigTitle = 24;

  ///标题：appbar里的title
  static final double appbar = 18;

  ///标题：appbar里的返回按钮和右边的文字按钮，正文内章节标题
  static final double appbarBack = 16;

  ///标题：正文一级标题
  static final double contentTitle = 16;

  ///标题：正文二级标题
  static final double contentTitleSecond = 12;

  ///标题：正文
  static final double content = 14;

  ///标题：提示、描述
  static final double tip = 12;

  ///标题：小标签
  static final double littleLabel = 10;

  ///主按钮
  static final double btn = 18;
}

class R {
  ///小按钮
  static final double small = 2;

  ///按钮
  static final double normal = 4;

  ///dialog
  static final double large = 6;

  ///投影模糊半径
  static final double shadow = 4;
}

class M {
  ///标题与正文上下结构时间距
  static final double titleToContent = 4;

  ///元素间距
  static final double item = 8;

  ///元素与屏幕的间距
  static final double screen = 15;

  ///模块间距，如登录界面logo和输入框之间的距离
  static final double module = 44;
}

class H {
  ///投影的距离
  static final double shadow = 2;

  ///tab标签的指示条高度
  static final double tabIndicator = 3;

  ///单行文本高度
  static final double singleText = 44;

  ///双行文本高度
  static final double doubleText = 60;

  ///单行卡片高度
  static final double singleCard = 60;

  ///双行卡片高度
  static final double doubleCard = 68;

  ///分组标题高度
  static final double groupTitle = 30;

  ///表单内分组信息组之间的高度
  static final double groupInfoMargin = 10;

  ///图标与文字呈左右结构时的距离
  static final double iconToText = 12;

  ///图标与文字呈左右结构时的最小距离
  static final double iconToTextMin = 8;

  ///文字与文字呈上下结构时的距离
  static final double textToText = 4;

  ///图标高度
  static final double icon = 36;

  ///tip文字前的图标高度
  static final double iconTip = 13;

  ///最小图标高度
  static final double iconMix = 18;

  ///小图标高度
  static final double iconSmall = 28;

  ///卡片中图标高度
  static final double iconInCard = 50;

  ///正文一级标题中图标高度
  static final double iconInContentTitle = 28;

  ///正文二级标题中图标高度
  static final double iconInSecondContentTitle = 12;

  ///首页底部导航栏高度
  static final double homeBottomBar = 50;

  ///标题栏高度
  static final double titleBar = 44;
}

class E {
  ///按钮的海拔
  static final double btn = 2;
}
