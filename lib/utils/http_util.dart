import 'package:fkb3_flutter/bean/bean_request_head.dart';
import 'package:fkb3_flutter/bean/bean_request.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fkb3_flutter/utils/user_util.dart';
import 'package:fkb3_flutter/utils/log_util.dart';

class HttpUtil {
  static String obtainRequestBody(Object content, {BeanRequestHead head}) {
    if (head == null) {
      head = BeanRequestHead();
    }
    BeanRequest request = new BeanRequest(head: head, content: content);
    return json.encode(request);
  }

  static Future<Map<String, dynamic>> doPostJson(String api, Object content,
      {BeanRequestHead head}) async {
    if (head == null) {
      head = BeanRequestHead(
          uid: UserUtil.getUserToken(),
          pws: UserUtil.getUserToken(),
          legalUnitID: UserUtil.getLegalUnitID());
    }
    String jsonStr = HttpUtil.obtainRequestBody(content, head: head);
    Log.d("请求地址：$api");
    Log.d("请求参数：$jsonStr");
    var response = await http
        .post(api, headers: {"Content-Type": "application/json"}, body: jsonStr)
        .timeout(Duration(seconds: 30), onTimeout: () {});
    if (response == null) {
      return null;
    } else {
      String responseStr = response.body.toString();
      Log.d("请求结果：$responseStr");
      var data = json.decode(response.body);
      return data;
    }
  }
}
