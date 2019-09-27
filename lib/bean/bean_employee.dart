class BeanEmployee {
  String bank;
  String bankCard;
  String carCard;
  String cellPhone;
  String companyCode;
  String companyName;
  String costCenterCD;
  String costCenterID;
  String costCenterName;
  String email;
  String employeeID;
  String employeeName;
  String employeePhoto;
  String fax;
  String iDCard;
  String legalUnitID;
  String officePhone;
  String passportCard;
  String post;
  String birthdayStr;
  String linkAccountID;

  BeanEmployee(
      {this.bank,
      this.bankCard,
      this.carCard,
      this.cellPhone,
      this.companyCode,
      this.companyName,
      this.costCenterCD,
      this.costCenterID,
      this.costCenterName,
      this.email,
      this.employeeID,
      this.employeeName,
      this.employeePhoto,
      this.fax,
      this.iDCard,
      this.legalUnitID,
      this.officePhone,
      this.passportCard,
      this.post,
      this.birthdayStr,
      this.linkAccountID,});

  BeanEmployee.fromJson(Map<String, dynamic> json) {
    bank = json['Bank'];
    bankCard = json['BankCard'];
    carCard = json['CarCard'];
    cellPhone = json['CellPhone'];
    companyCode = json['CompanyCode'];
    companyName = json['CompanyName'];
    costCenterCD = json['CostCenterCD'];
    costCenterID = json['CostCenterID'];
    costCenterName = json['CostCenterName'];
    email = json['Email'];
    employeeID = json['EmployeeID'];
    employeeName = json['EmployeeName'];
    employeePhoto = json['EmployeePhoto'];
    fax = json['Fax'];
    iDCard = json['IDCard'];
    legalUnitID = json['LegalUnitID'];
    officePhone = json['OfficePhone'];
    passportCard = json['PassportCard'];
    post = json['Post'];
    birthdayStr = json['BirthdayStr'];
    linkAccountID = json['LinkAccountID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bank'] = this.bank;
    data['BankCard'] = this.bankCard;
    data['CarCard'] = this.carCard;
    data['CellPhone'] = this.cellPhone;
    data['CompanyCode'] = this.companyCode;
    data['CompanyName'] = this.companyName;
    data['CostCenterCD'] = this.costCenterCD;
    data['CostCenterID'] = this.costCenterID;
    data['CostCenterName'] = this.costCenterName;
    data['Email'] = this.email;
    data['EmployeeID'] = this.employeeID;
    data['EmployeeName'] = this.employeeName;
    data['EmployeePhoto'] = this.employeePhoto;
    data['Fax'] = this.fax;
    data['IDCard'] = this.iDCard;
    data['LegalUnitID'] = this.legalUnitID;
    data['OfficePhone'] = this.officePhone;
    data['PassportCard'] = this.passportCard;
    data['Post'] = this.post;
    data['BirthdayStr'] = this.birthdayStr;
    data['LinkAccountID'] = this.linkAccountID;
    return data;
  }
}
