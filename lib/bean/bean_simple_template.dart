class BeanSimpleTemplate {
  String templateId;
  String currentVersion;

  BeanSimpleTemplate({this.templateId, this.currentVersion});

  BeanSimpleTemplate.fromJson(Map<String, dynamic> json) {
    templateId = json['templateId'];
    currentVersion = json['currentVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['templateId'] = this.templateId;
    data['currentVersion'] = this.currentVersion;
    return data;
  }
}
