import 'bean_base.dart';

class BeanRequestBillList extends BeanBase {
  String bizType;
  String startTime = "0001-01-01";
  String endTime = "0001-01-01";
  int bizStatus;
  int pageSize;
  int page;

  BeanRequestBillList({this.bizType, this.bizStatus, this.pageSize, this.page});

  BeanRequestBillList.fromJson(Map<String, dynamic> json) {
    endTime = json['EndTime'];
    startTime = json['StartTime'];
    bizType = json['BizType'];
    bizStatus = json['BizStatus'];
    pageSize = json['PageSize'];
    page = json['Page'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EndTime'] = this.endTime;
    data['StartTime'] = this.startTime;
    data['BizType'] = this.bizType;
    data['BizStatus'] = this.bizStatus;
    data['PageSize'] = this.pageSize;
    data['Page'] = this.page;
    return data;
  }
}
