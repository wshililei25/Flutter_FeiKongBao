class BeanStaticData {
  int staticType;
  String staticName;
  String staticEnName;
  String staticID;
  String staticCD;
  String staticLogo;
  String legalUnitID;
  String orgID;
  String extra1;
  String extra2;
  String extra3;
  String dimension1;
  String dimension2;
  String dimension3;
  bool isDefault;

  BeanStaticData(
      {this.staticType,
      this.staticName,
      this.staticEnName,
      this.staticID,
      this.staticCD,
      this.staticLogo,
      this.legalUnitID,
      this.orgID,
      this.extra1,
      this.extra2,
      this.extra3,
      this.dimension1,
      this.dimension2,
      this.dimension3,
      this.isDefault});

  BeanStaticData.fromJson(Map<String, dynamic> json) {
    staticType = json['staticType'];
    staticName = json['staticName'];
    staticEnName = json['staticEnName'];
    staticID = json['staticID'];
    staticCD = json['staticCD'];
    staticLogo = json['staticLogo'];
    legalUnitID = json['legalUnitID'];
    orgID = json['orgID'];
    extra1 = json['extra1'];
    extra2 = json['extra2'];
    extra3 = json['extra3'];
    dimension1 = json['dimension1'];
    dimension2 = json['dimension2'];
    dimension3 = json['dimension3'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['staticType'] = this.staticType;
    data['staticName'] = this.staticName;
    data['staticEnName'] = this.staticEnName;
    data['staticID'] = this.staticID;
    data['staticCD'] = this.staticCD;
    data['staticLogo'] = this.staticLogo;
    data['legalUnitID'] = this.legalUnitID;
    data['orgID'] = this.orgID;
    data['extra1'] = this.extra1;
    data['extra2'] = this.extra2;
    data['extra3'] = this.extra3;
    data['dimension1'] = this.dimension1;
    data['dimension2'] = this.dimension2;
    data['dimension3'] = this.dimension3;
    data['isDefault'] = this.isDefault;
    return data;
  }
}
