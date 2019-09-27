import 'bean_response_head.dart';

class BeanResponse<T> {
  T content;
  BeanResponseHead head;

  BeanResponse.fromJson(Map<String, dynamic> json) {
    content = json['Content'];
    head = json['Head'] != null
        ? new BeanResponseHead.fromJson(json['Head'])
        : null;
  }
}
