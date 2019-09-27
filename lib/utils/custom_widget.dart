import 'constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'comm_util.dart';

///按钮：
///1、蓝色圆角背景白色文字按钮
class BtnPrimaryCorner extends RaisedButton {
  BtnPrimaryCorner(String text, {@required VoidCallback onPressed})
      : super(
          onPressed: onPressed,
          child: TextWhiteBtn(text),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(R.normal))),
          textColor: C.textWhite,
          color: C.primary,
          elevation: E.btn,
        );
}

///2、蓝色边框蓝色文字镂空按钮
class BtnPrimaryBorderCorner extends FlatButton {
  BtnPrimaryBorderCorner(String text, {@required VoidCallback onPressed})
      : super(
          onPressed: onPressed,
          child: TextPrimaryBtn(text),
          shape: RoundedRectangleBorder(
              side: BorderSide(style: BorderStyle.solid, color: C.primary),
              borderRadius: BorderRadius.all(Radius.circular(R.normal))),
        );
}

///3、蓝色文字按钮（无背景无边框）
class BtnPrimaryTextNoBg extends FlatButton {
  BtnPrimaryTextNoBg(String text, {@required VoidCallback onPressed})
      : super(
          onPressed: onPressed,
          child: TextPrimaryBtn(text),
        );
}

///文本框：
///1、黑色正文
class TextBlackContentStyle extends TextStyle {
  TextBlackContentStyle()
      : super(fontSize: TextSize.content, color: C.textContent);
}

class TextHintContentStyle extends TextStyle {
  TextHintContentStyle()
      : super(fontSize: TextSize.content, color: C.textHintColor);
}

class TextSecondContentStyle extends TextStyle {
  TextSecondContentStyle()
      : super(fontSize: TextSize.content, color: C.textContentSecond);
}

class TextThirdContentStyle extends TextStyle {
  TextThirdContentStyle()
      : super(fontSize: TextSize.content, color: C.textContentThird);
}

class TextBlackContent extends Text {
  TextBlackContent(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextBlackContentStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextHintContent extends Text {
  TextHintContent(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextHintContentStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextSecondContent extends Text {
  TextSecondContent(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextSecondContentStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextThirdContent extends Text {
  TextThirdContent(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextThirdContentStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

///2、灰色描述
class TextGrayTipStyle extends TextStyle {
  TextGrayTipStyle() : super(fontSize: TextSize.tip, color: C.textHintColor);
}

class TextGrayTip extends Text {
  TextGrayTip(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextGrayTipStyle(), maxLines: maxLines, overflow: overflow);
}

///3、黑色标题
class TextBlackTitleStyle extends TextStyle {
  TextBlackTitleStyle()
      : super(fontSize: TextSize.contentTitle, color: C.textContent);
}

class TextHintTitleStyle extends TextStyle {
  TextHintTitleStyle()
      : super(fontSize: TextSize.contentTitle, color: C.textHintColor);
}

class TextSecondTitleStyle extends TextStyle {
  TextSecondTitleStyle()
      : super(fontSize: TextSize.contentTitle, color: C.textContentSecond);
}

class TextThirdTitleStyle extends TextStyle {
  TextThirdTitleStyle()
      : super(fontSize: TextSize.contentTitle, color: C.textContentThird);
}

class TextThirdTipStyle extends TextStyle {
  TextThirdTipStyle()
      : super(fontSize: TextSize.tip, color: C.textContentThird);
}

class TextBlackTitle extends Text {
  TextBlackTitle(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextBlackTitleStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextHintTitle extends Text {
  TextHintTitle(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextHintTitleStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextSecondTitle extends Text {
  TextSecondTitle(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextSecondTitleStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextThirdTitle extends Text {
  TextThirdTitle(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextThirdTitleStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextThirdTip extends Text {
  TextThirdTip(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextThirdTipStyle(), maxLines: maxLines, overflow: overflow);
}

///4、白色标题
class TextWhiteTitleStyle extends TextStyle {
  TextWhiteTitleStyle()
      : super(fontSize: TextSize.contentTitle, color: C.textWhite);
}

class TextWhiteAppBarStyle extends TextStyle {
  TextWhiteAppBarStyle() : super(fontSize: TextSize.appbar, color: C.textWhite);
}

class TextWhiteTitle extends Text {
  TextWhiteTitle(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextWhiteTitleStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextWhiteAppbar extends Text {
  TextWhiteAppbar(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextWhiteAppBarStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

///5、白色描述
class TextWhiteTipStyle extends TextStyle {
  TextWhiteTipStyle() : super(fontSize: TextSize.tip, color: C.textWhite);
}

class TextWhiteTip extends Text {
  TextWhiteTip(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextWhiteTipStyle(), maxLines: maxLines, overflow: overflow);
}

class TextBlackTipStyle extends TextStyle {
  TextBlackTipStyle() : super(fontSize: TextSize.tip, color: C.textContent);
}

class TextBlackTip extends Text {
  TextBlackTip(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextBlackTipStyle(), maxLines: maxLines, overflow: overflow);
}

class TextBlackSecondTipStyle extends TextStyle {
  TextBlackSecondTipStyle()
      : super(fontSize: TextSize.tip, color: C.textContentSecond);
}

class TextBlackSecondTip extends Text {
  TextBlackSecondTip(String data, {int maxLines, TextOverflow overflow})
      : super(data, style: TextBlackSecondTipStyle(), maxLines: maxLines);
}

class TextHintTipStyle extends TextStyle {
  TextHintTipStyle() : super(fontSize: TextSize.tip, color: C.textHintColor);
}

class TextHintTip extends Text {
  TextHintTip(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextHintTipStyle(), maxLines: maxLines, overflow: overflow);
}

///5、主色（蓝色）描述
class TextPrimaryTipStyle extends TextStyle {
  TextPrimaryTipStyle() : super(fontSize: TextSize.tip, color: C.primary);
}

class TextPrimaryTitleStyle extends TextStyle {
  TextPrimaryTitleStyle()
      : super(fontSize: TextSize.contentTitle, color: C.primary);
}

class TextPrimaryTip extends Text {
  TextPrimaryTip(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextPrimaryTipStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

class TextPrimaryTitle extends Text {
  TextPrimaryTitle(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextPrimaryTitleStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

///5、白色按钮
class TextWhiteBtnStyle extends TextStyle {
  TextWhiteBtnStyle() : super(fontSize: TextSize.btn, color: C.textWhite);
}

class TextWhiteBtn extends Text {
  TextWhiteBtn(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextWhiteBtnStyle(), maxLines: maxLines, overflow: overflow);
}

///5、主色（背景）按钮
class TextPrimaryBtnStyle extends TextStyle {
  TextPrimaryBtnStyle() : super(fontSize: TextSize.btn, color: C.primary);
}

class TextPrimaryBtn extends Text {
  TextPrimaryBtn(String data, {int maxLines, TextOverflow overflow})
      : super(data,
            style: TextPrimaryBtnStyle(),
            maxLines: maxLines,
            overflow: overflow);
}

///图标
class ImageArrowRight extends Image {
  ImageArrowRight()
      : super.asset(CommUtil.getImgPath("arrow_right"),
            width: ScreenUtil().setWidth(6),
            height: ScreenUtil().setHeight(10));
}

class ImageMix extends Image {
  ImageMix.asset(String name)
      : super.asset(CommUtil.getImgPath(name),
            width: ScreenUtil().setWidth(H.iconMix),
            height: ScreenUtil().setHeight(H.iconMix));

  ImageMix.network(String url, {String fullPath})
      : super.network(CommUtil.getNetImgPath(url, fullPath: fullPath),
            width: ScreenUtil().setWidth(H.iconMix),
            height: ScreenUtil().setHeight(H.iconMix));
}

class ImageSmall extends Image {
  ImageSmall.asset(String name)
      : super.asset(CommUtil.getImgPath(name),
            width: ScreenUtil().setWidth(H.iconSmall),
            height: ScreenUtil().setHeight(H.iconSmall));

  ImageSmall.network(String url, {String fullPath})
      : super.network(CommUtil.getNetImgPath(url, fullPath: fullPath),
            width: ScreenUtil().setWidth(H.iconSmall),
            height: ScreenUtil().setHeight(H.iconSmall));
}

class ImageNormal extends Image {
  ImageNormal.asset(String name)
      : super.asset(CommUtil.getImgPath(name),
            width: ScreenUtil().setWidth(H.icon),
            height: ScreenUtil().setHeight(H.icon));

  ImageNormal.network(String url, {String fullPath})
      : super.network(CommUtil.getNetImgPath(url, fullPath: fullPath),
            width: ScreenUtil().setWidth(H.icon),
            height: ScreenUtil().setHeight(H.icon));
}

class ImageLarge extends Image {
  ImageLarge.asset(String name)
      : super.asset(CommUtil.getImgPath(name),
            width: ScreenUtil().setWidth(H.iconInCard),
            height: ScreenUtil().setHeight(H.iconInCard));

  ImageLarge.network(String url, {String fullPath})
      : super.network(CommUtil.getNetImgPath(url, fullPath: fullPath),
            width: ScreenUtil().setWidth(H.iconInCard),
            height: ScreenUtil().setHeight(H.iconInCard));
}

///listview里面底部分割线的item背景
class DecorationBottomLine extends BoxDecoration {
  DecorationBottomLine()
      : super(
            color: C.contentBackground,
            border: Border(bottom: BorderSide(color: C.divider)));
}

class ContainerBottomLine extends Container {
  ContainerBottomLine({Widget child, double height, EdgeInsetsGeometry padding})
      : super(
            child: child,
            padding: padding == null ? EdgeInsets.all(M.screen) : padding,
            decoration: DecorationBottomLine(),
            height: height);
}

///单据列表样式的布局，左边一个icon，右边一个箭头，中间是内容
class BillItemLayout extends StatelessWidget {
  final String icon;
  final Widget child;
  final String iconUrl;
  final GestureTapCallback onTap;

  BillItemLayout(
      {@required this.icon, @required this.child, this.iconUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ContainerBottomLine(
        child: InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: (iconUrl == null || iconUrl.isEmpty)
                ? ImageLarge.asset(icon)
                : ImageLarge.network(iconUrl),
            padding: EdgeInsets.fromLTRB(0, 0, H.iconToTextMin, 0),
          ),
          Expanded(
            child: child,
          ),
          Padding(
            child: ImageArrowRight(),
            padding: EdgeInsets.fromLTRB(H.iconToTextMin, 0, 0, 0),
          )
        ],
      ),
    ));
  }
}

///单据界面中的左右结构，左边标签右边内容
class BizLeftRightWidget extends StatelessWidget {
  final String label;
  final Widget content;

  BizLeftRightWidget({@required this.label, this.content});

  @override
  Widget build(BuildContext context) {
    return ContainerBottomLine(
        padding: EdgeInsets.fromLTRB(M.screen, 0, M.screen, 0),
        height: ScreenUtil().setHeight(H.singleText),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              child: TextBlackContent(label),
              padding: EdgeInsets.fromLTRB(0, 0, H.iconToText, 0),
            ),
            content == null ? Container() : content
          ],
        ));
  }
}
