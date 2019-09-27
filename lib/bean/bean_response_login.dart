import 'bean_employee.dart';
import 'bean_menu.dart';

class BeanResponseLogin {
  BeanEmployee employeeInfo;
  String token;
  List<BeanMenu> menus;

  BeanResponseLogin({this.employeeInfo, this.token, this.menus});

  BeanResponseLogin.fromJson(Map<String, dynamic> json) {
    employeeInfo = json['EmployeeInfo'] != null
        ? new BeanEmployee.fromJson(json['EmployeeInfo'])
        : null;
    token = json['Token'] != null ? json['Token'] : null;
    if (json['Menus'] != null) {
      menus = new List<BeanMenu>();
      json['Menus'].forEach((v) {
        menus.add(new BeanMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeeInfo != null) {
      data['EmployeeInfo'] = this.employeeInfo.toJson();
    }
    if (this.token != null) {
      data['Token'] = this.token;
    }
    return data;
  }
}
