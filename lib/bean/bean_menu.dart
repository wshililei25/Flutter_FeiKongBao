class BeanMenu {
  String code;
  String companyGUID;
  String groupName;
  String groupNameEN;
  String icon;
  String iconName;
  String iconNameEN;
  bool isActive;
  String menuID;
  int orderBy;
  String groupCode;
  int type;
  String relateMenuID;
  String url;
  int editFlag;
  String iconPath;

  BeanMenu(
      {this.code,
      this.companyGUID,
      this.groupName,
      this.groupNameEN,
      this.icon,
      this.iconName,
      this.iconNameEN,
      this.isActive,
      this.menuID,
      this.orderBy,
      this.groupCode,
      this.type,
      this.relateMenuID,
      this.url,
      this.editFlag,
      this.iconPath});

  BeanMenu.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    companyGUID = json['CompanyGUID'];
    groupName = json['GroupName'];
    groupNameEN = json['GroupNameEN'];
    icon = json['Icon'];
    iconName = json['IconName'];
    iconNameEN = json['IconNameEN'];
    isActive = json['IsActive'] == 1;
    menuID = json['MenuID'];
    orderBy = json['OrderBy'];
    groupCode = json['GroupCode'];
    type = json['Type'];
    relateMenuID = json['RelateMenuID'];
    url = json['Url'];
    editFlag = json['EditFlag'];
    iconPath = json['IconPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['CompanyGUID'] = this.companyGUID;
    data['GroupName'] = this.groupName;
    data['GroupNameEN'] = this.groupNameEN;
    data['Icon'] = this.icon;
    data['IconName'] = this.iconName;
    data['IconNameEN'] = this.iconNameEN;
    data['IsActive'] = this.isActive;
    data['MenuID'] = this.menuID;
    data['OrderBy'] = this.orderBy;
    data['GroupCode'] = this.groupCode;
    data['Type'] = this.type;
    data['RelateMenuID'] = this.relateMenuID;
    data['Url'] = this.url;
    data['EditFlag'] = this.editFlag;
    data['IconPath'] = this.iconPath;
    return data;
  }
}
