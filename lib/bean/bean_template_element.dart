class BeanTemplateElement {
  String lable;
  String lableEn;
  String placeHolder;
  String placeHolderEn;
  String groupID;
  String groupName;
  String groupNameEn;
  String key;
  String dataPrecision;
  String templateID;
  int elementType;
  int roundType;
  int maxLength;
  int orderBy;
  bool readOnly;

  BeanTemplateElement(
      {this.elementType,
      this.readOnly,
      this.lable,
      this.lableEn,
      this.placeHolder,
      this.placeHolderEn,
      this.groupID,
      this.groupName,
      this.groupNameEn,
      this.orderBy,
      this.key,
      this.dataPrecision,
      this.roundType,
      this.maxLength,
      this.templateID});

  BeanTemplateElement.fromJson(Map<String, dynamic> json) {
    elementType = json['elementType'];
    readOnly = json['readOnly'] == 1;
    lable = json['lable'];
    lableEn = json['lableEn'];
    placeHolder = json['placeHolder'];
    placeHolderEn = json['placeHolderEn'];
    groupID = json['groupID'];
    groupName = json['groupName'];
    groupNameEn = json['groupNameEn'];
    orderBy = json['orderBy'];
    key = json['key'];
    dataPrecision = json['dataPrecision'];
    roundType = json['roundType'];
    maxLength = json['maxLength'];
    templateID = json['templateID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elementType'] = this.elementType;
    data['readOnly'] = this.readOnly;
    data['lable'] = this.lable;
    data['lableEn'] = this.lableEn;
    data['placeHolder'] = this.placeHolder;
    data['placeHolderEn'] = this.placeHolderEn;
    data['groupID'] = this.groupID;
    data['groupName'] = this.groupName;
    data['groupNameEn'] = this.groupNameEn;
    data['orderBy'] = this.orderBy;
    data['key'] = this.key;
    data['dataPrecision'] = this.dataPrecision;
    data['roundType'] = this.roundType;
    data['maxLength'] = this.maxLength;
    data['templateID'] = this.templateID;
    return data;
  }
}
