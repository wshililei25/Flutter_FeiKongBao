import 'package:http/http.dart' as http;
import 'dart:convert';

class FileUtil {
  static void downloadFile(String fileUrl, {callback}) {
    http
        .get(fileUrl, headers: {"charset": "utf-8"})
        .timeout(Duration(seconds: 30), onTimeout: () {})
        .then((response) {
          Utf8Decoder utf8decoder = Utf8Decoder();
          String result = utf8decoder.convert(response.bodyBytes);
          callback(result);
        });
  }
}
