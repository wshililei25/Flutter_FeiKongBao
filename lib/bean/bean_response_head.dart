import 'bean_base.dart';

class BeanResponseHead extends BeanBase {
  int ret;
  int code;
  String msg;

  BeanResponseHead({this.ret, this.code, this.msg});

  BeanResponseHead.fromJson(Map<String, dynamic> json) {
    ret = json['Ret'];
    code = json['Code'];
    msg = json['Msg'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ret'] = this.ret;
    data['Code'] = this.code;
    data['Msg'] = this.msg;
    return data;
  }
}
