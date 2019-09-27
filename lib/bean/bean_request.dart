import 'bean_request_head.dart';
import 'bean_base.dart';

class BeanRequest {
  BeanRequestHead head;
  dynamic content;

  BeanRequest({this.head, this.content});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.head != null) {
      data['Head'] = this.head.toJson();
    }
    if (this.content != null && this.content is BeanBase) {
      BeanBase base = this.content as BeanBase;
      data['Content'] = base.toJson();
    } else {
      data['Content'] = this.content.toString();
    }
    return data;
  }
}
