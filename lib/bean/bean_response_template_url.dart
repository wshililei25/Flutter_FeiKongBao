class BeanResponseTemplateUrl {
  String templateUrl;

  BeanResponseTemplateUrl({this.templateUrl});

  BeanResponseTemplateUrl.fromJson(Map<String, dynamic> json) {
    templateUrl = json['templateUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['templateUrl'] = this.templateUrl;
    return data;
  }
}
