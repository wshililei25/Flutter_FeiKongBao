import 'user_util.dart';

class CommUtil {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }

  static String getNetImgPath(String name, {String fullPath}) {
    if (fullPath == null)
      return '${UserUtil.getUserBaseUrl()}/$name';
    else
      return fullPath;
  }

  static int getColorFromHex(String hexColor) {
    if (hexColor == null || hexColor.length < 6) {
      return int.parse("FF000000", radix: 16);
    }
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    hexColor = hexColor.replaceAll('0X', '');
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
