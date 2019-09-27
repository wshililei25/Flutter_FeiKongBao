import 'package:flutter/material.dart';
import 'package:fkb3_flutter/generated/i18n.dart';

class BizType {
  static const String fullType = "fullType";
  static const String simpleType = "simpleType";
  static const String fullName = "fullName";
  static const String simpleName = "simpleName";
  static const String icon = "icon";
  static const String service = "service";
  static const String service_bill = "service_bill";
  static const String service_purchase = "service_purchase";
  static var get = {};

  static const String travelReimburse = "travelReimburse"; //出差报销单
  static const String dailyReimburse = "dailyReimburse";
  static const String travelApply = "travelApply";
  static const String dailyApply = "dailyApply";
  static const String repayment = "repayment";
  static const String cashAdvance = "cashAdvance";
  static const String purchaseApply = "purchaseApply";
  static const String purchaseDetail = "purchaseDetail";
  static const String contractSign = "contractSign";
  static const String payApply = "payApply";
  static const String payDetail = "payDetail";
  static const String myInvoice = "myInvoice";
  static const String trip = "trip";
  static const String contractDetail = "contractDetail";
  static const String supplier = "supplier";

  static init(BuildContext context) {
    get[travelReimburse] = {
      fullType: "T_ExpenseApplyMst",
      simpleType: "EC",
      fullName: S.of(context).cTravelReimbursement,
      simpleName: S.of(context).cTravelReimbursementSimpleName,
      icon: "icon_travel_reimbursement",
      service: service_bill
    };
    get[dailyReimburse] = {
      fullType: "T_DailyExpenseApplyMst",
      simpleType: "DC",
      fullName: S.of(context).cDailyReimbursement,
      simpleName: S.of(context).cDailyReimbursementSimpleName,
      icon: "icon_daily_reimbursement",
      service: service_bill
    };
    get[travelApply] = {
      fullType: "T_TravelApplyMst",
      simpleType: "TA",
      fullName: S.of(context).cTravelApply,
      simpleName: S.of(context).cTravelApplySimpleName,
      icon: "icon_travel_apply",
      service: service_bill
    };
    get[dailyApply] = {
      fullType: "T_DailyApplyMst",
      simpleType: "DS",
      fullName: S.of(context).cDailyApply,
      simpleName: S.of(context).cDailyApplySimpleName,
      icon: "icon_daily_apply",
      service: service_bill
    };
    get[repayment] = {
      fullType: "T_BackCashApplyMst",
      simpleType: "CR",
      fullName: S.of(context).cRepayment,
      simpleName: S.of(context).cRepaymentSimpleName,
      icon: "icon_back_cash",
      service: service_bill
    };
    get[cashAdvance] = {
      fullType: "T_PreCashApplyMst",
      simpleType: "PA",
      fullName: S.of(context).cCashAdvance,
      simpleName: S.of(context).cCashAdvanceSimpleName,
      icon: "icon_cash_advance",
      service: service_bill
    };
    get[purchaseApply] = {
      fullType: "T_PurApplyMst",
      simpleType: "PM",
      fullName: S.of(context).cPurchaseApply,
      simpleName: S.of(context).cPurchaseApplySimpleName,
      icon: "icon_purchase_apply",
      service: service_purchase
    };
    get[purchaseDetail] = {
      fullType: "T_PurApplyDtl",
      simpleType: "T_PurApplyDtl",
      fullName: S.of(context).cPurchaseDetail,
      simpleName: S.of(context).cPurchaseDetailSimpleName,
      icon: "icon_purchase_detail",
      service: service_purchase
    };
    get[contractSign] = {
      fullType: "T_PurCotrSign",
      simpleType: "PS",
      fullName: S.of(context).cContractSign,
      simpleName: S.of(context).cContractSignSimpleName,
      icon: "icon_contract_sign",
      service: service_purchase
    };
    get[payApply] = {
      fullType: "T_PurPayApplyMst",
      simpleType: "PP",
      fullName: S.of(context).cPayApply,
      simpleName: S.of(context).cPayApplySimpleName,
      icon: "icon_pay_apply",
      service: service_purchase
    };
    get[payDetail] = {
      fullType: "T_PurPayApplyDtl",
      simpleType: "T_PurPayApplyDtl",
      fullName: S.of(context).cPayDetail,
      simpleName: S.of(context).cPayDetailSimpleName,
      icon: "icon_payment_detail",
      service: service_purchase
    };
    get[myInvoice] = {
      fullType: "MyInvoice",
      simpleType: "MyInvoice",
      fullName: S.of(context).cMyInvoice,
      simpleName: S.of(context).cMyInvoice,
      icon: "icon_payment_detail",
      service: ""
    };
    get[trip] = {
      fullType: "T_BILLTRIP",
      simpleType: "T_BILLTRIP",
      fullName: S.of(context).cTravelTrip,
      simpleName: S.of(context).cTravelTrip,
      icon: "icon_travel_apply",
      service: ""
    };
    get[contractDetail] = {
      fullType: "T_PurCotrDtl",
      simpleType: "T_PurCotrDtl",
      fullName: S.of(context).cContractDetail,
      simpleName: S.of(context).cContractDetail,
      icon: "icon_contract_sign",
      service: service_purchase
    };
    get[supplier] = {
      fullType: "T_PurSupplier",
      simpleType: "T_PurSupplier",
      fullName: S.of(context).cSupplier,
      simpleName: S.of(context).cSupplierSim,
      icon: "fkb_icon_gysxx",
      service: service_purchase
    };
  }

  static Map<String, String> getTypeByMenuCode(String code) {
    switch (code) {
      case "PayMst":
        return get[payApply];
      case "PayDtl":
        return get[payDetail];
      case "PurchaseContract":
        return get[contractSign];
      case "PurchaseMst":
        return get[purchaseApply];
      case "PurchaseDtl":
        return get[purchaseDetail];
      case "Supplier":
        return get[supplier];
      case "TravelApply":
        return get[travelApply];
      case "BackCash":
        return get[repayment];
      case "PreCash":
        return get[cashAdvance];
      case "DaliyExpense":
        return get[dailyReimburse];
      case "DaliyApply":
        return get[dailyApply];
      case "TravelExpense":
        return get[travelReimburse];
      case "MyInvoice":
        return get[myInvoice];
      default:
        return null;
    }
  }
}
