import 'package:fkb3_flutter/utils/user_util.dart';
import 'bean_base.dart';

class BeanRequestHead extends BeanBase {
  String uid = UserUtil.getUserToken();
  String pws = UserUtil.getUserToken();
  String language;
  String legalUnitID = "";

  BeanRequestHead(
      {this.uid, this.pws, this.language = "zh", this.legalUnitID});

  BeanRequestHead.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    pws = json['pws'];
    language = json['Language'];
    legalUnitID = json['LegalUnitID'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['pws'] = this.pws;
    data['Language'] = this.language;
    data['LegalUnitID'] = this.legalUnitID;
    return data;
  }
}
