import 'bean_base.dart';

class BeanRequestLogin extends BeanBase {
  String deviceToken;
  String legalUnitID;

  BeanRequestLogin(this.deviceToken, this.legalUnitID);

  BeanRequestLogin.fromJson(Map<String, dynamic> json) {
    deviceToken = json['DeviceToken'];
    legalUnitID = json['LegalUnitID'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceToken'] = this.deviceToken;
    data['LegalUnitID'] = this.legalUnitID;
    return data;
  }
}
