class BeanSimpleBill {
  String expenseClaimReason;
  String bizCD;
  String creatDateStr;
  String bizType;
  String bizIcon;
  String bizID;
  String lastStatusDesc;
  String billStatusColor;

  BeanSimpleBill(
      {this.expenseClaimReason,
      this.bizCD,
      this.creatDateStr,
      this.bizType,
      this.bizIcon,
      this.lastStatusDesc,
      this.billStatusColor,
      this.bizID});

  BeanSimpleBill.fromJson(Map<String, dynamic> json) {
    expenseClaimReason = json['ExpenseClaimReason'];
    bizCD = json['BizCD'];
    creatDateStr = json['CreatDateStr'];
    bizType = json['BizType'];
    bizIcon = json['BizIcon'];
    bizID = json['BizID'];
    lastStatusDesc = json['LastStatusDesc'];
    billStatusColor = json['BillStatusColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ExpenseClaimReason'] = this.expenseClaimReason;
    data['BizCD'] = this.bizCD;
    data['CreatDateStr'] = this.creatDateStr;
    data['BizType'] = this.bizType;
    data['BizIcon'] = this.bizIcon;
    data['BizID'] = this.bizID;
    data['LastStatusDesc'] = this.lastStatusDesc;
    data['BillStatusColor'] = this.billStatusColor;
    return data;
  }
}
