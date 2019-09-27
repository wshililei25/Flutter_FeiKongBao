import 'bean_template_element.dart';

class BeanTemplateInfo {
  String templateID;
  String templateVersion;
  String templateName;
  String simpleName;
  String templateType;
  String simpleType;
  String saveSuccessKey;
  String saveFailKey;
  String saveUrl;
  String submitUrl;
  String legalUnitID;
  String intKey;
  int pageLevel;
  int documentType;
  int docBusinessType;
  int saveRequestType;
  List<BeanTemplateElement> elements;

  BeanTemplateInfo(
      {this.pageLevel,
      this.templateVersion,
      this.documentType,
      this.docBusinessType,
      this.templateName,
      this.simpleName,
      this.templateID,
      this.templateType,
      this.simpleType,
      this.saveSuccessKey,
      this.saveFailKey,
      this.saveRequestType,
      this.saveUrl,
      this.submitUrl,
      this.legalUnitID,
      this.intKey,
      this.elements});

  BeanTemplateInfo.fromJson(Map<String, dynamic> json) {
    pageLevel = json['pageLevel'];
    templateVersion = json['templateVersion'];
    documentType = json['documentType'];
    docBusinessType = json['docBusinessType'];
    templateName = json['templateName'];
    simpleName = json['simpleName'];
    templateID = json['templateID'];
    templateType = json['templateType'];
    simpleType = json['simpleType'];
    saveSuccessKey = json['saveSuccessKey'];
    saveFailKey = json['saveFailKey'];
    saveRequestType = json['saveRequestType'];
    saveUrl = json['saveUrl'];
    submitUrl = json['submitUrl'];
    legalUnitID = json['legalUnitID'];
    intKey = json['intKey'];
    if (json['elements'] != null) {
      elements = new List<BeanTemplateElement>();
      json['elements'].forEach((v) {
        elements.add(new BeanTemplateElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageLevel'] = this.pageLevel;
    data['templateVersion'] = this.templateVersion;
    data['documentType'] = this.documentType;
    data['docBusinessType'] = this.docBusinessType;
    data['templateName'] = this.templateName;
    data['simpleName'] = this.simpleName;
    data['templateID'] = this.templateID;
    data['templateType'] = this.templateType;
    data['simpleType'] = this.simpleType;
    data['saveSuccessKey'] = this.saveSuccessKey;
    data['saveFailKey'] = this.saveFailKey;
    data['saveRequestType'] = this.saveRequestType;
    data['saveUrl'] = this.saveUrl;
    data['submitUrl'] = this.submitUrl;
    data['legalUnitID'] = this.legalUnitID;
    data['intKey'] = this.intKey;
//    if (this.elements != null) {
//      data['elements'] = this.elements.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}
