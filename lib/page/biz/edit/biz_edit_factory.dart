import 'package:flutter/material.dart';
import 'package:fkb3_flutter/bean/bean_template_element.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';

class BizEditFactory {
  static var bizListFactories = <int, BizItemFactory>{};

  static registerFactory(int elementType, BizItemFactory factory) {
    bizListFactories[elementType] = factory;
  }

  static BizItemFactory getFactory(int elementType) {
    return bizListFactories[elementType];
  }
}

abstract class BizItemFactory {
  Widget buildWidget(BeanTemplateElement element);
}

class ElementType {
  /*
    TEXT(0), 文本框
    GROUP_TITLE(1), 分组
    EDIT(2), 输入框
    RADIOBOX(3), checkbox类型
    SWITCH(4), 开关
    SELECT_VIEW(5), 下拉框
    SOFT_TIP(6), 软控提示语
    DATE(7), 时间
    LONG_TEXT(8), 长文本
    NUMBER(9), 数字
    MONEY(10), 金额
    EXPENSE(11), 开支流水
    INVOICE(12), 发票
    ATTACHMENT(13), 附件
    COMM_BILL(14); 通用类型
    APPLY_BUDGET(15), 申请单的预算费用
    CASH_ADVANCE_BUDGET(16), 现金预支单的申请预算
    SELECT_CITY(17) 选择城市
 */
  static const TEXT = 0;
  static const GROUP_TITLE = 1;
  static const EDIT = 2;
  static const RADIO_BOX = 3;
  static const SWITCH = 4;
  static const SELECT_VIEW = 5;
  static const SOFT_TIP = 6;
  static const DATE = 7;
  static const LONG_TEXT = 8;
  static const NUMBER = 9;
  static const MONEY = 10;
  static const EXPENSE = 11;
  static const INVOICE = 12;
  static const ATTACHMENT = 13;
  static const COMM_BILL = 14;
  static const APPLY_BUDGET = 15;
  static const CASH_ADVANCE_BUDGET = 16;
  static const SELECT_CITY = 17;
  static const SELECT_EMPLOYEE = 18;

  static init() {
    BizEditFactory.registerFactory(TEXT, TextFactory());
    BizEditFactory.registerFactory(GROUP_TITLE, GroupTitleFactory());
    BizEditFactory.registerFactory(EDIT, EditFactory());
    BizEditFactory.registerFactory(RADIO_BOX, RadioBoxFactory());
    BizEditFactory.registerFactory(SWITCH, SwitchFactory());
    BizEditFactory.registerFactory(SELECT_VIEW, SelectViewFactory());
    BizEditFactory.registerFactory(SOFT_TIP, SoftTipFactory());
    BizEditFactory.registerFactory(DATE, DateFactory());
    BizEditFactory.registerFactory(LONG_TEXT, LongTextFactory());
    BizEditFactory.registerFactory(NUMBER, NumberFactory());
    BizEditFactory.registerFactory(MONEY, MoneyFactory());
    BizEditFactory.registerFactory(INVOICE, InvoiceFactory());
    BizEditFactory.registerFactory(ATTACHMENT, AttachmentFactory());
    BizEditFactory.registerFactory(COMM_BILL, CommBillFactory());
    BizEditFactory.registerFactory(APPLY_BUDGET, ApplyBudgetFactory());
    BizEditFactory.registerFactory(
        CASH_ADVANCE_BUDGET, CashAdvanceBudgetFactory());
    BizEditFactory.registerFactory(SELECT_CITY, SelectCityFactory());
    BizEditFactory.registerFactory(SELECT_EMPLOYEE, SelectEmployeeFactory());
  }
}

class TextFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(
      label: element.lable,
      content: TextBlackContent("内容内容"),
    );
  }
}

class GroupTitleFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return Container(
      color: C.background,
      height: H.groupInfoMargin,
    );
  }
}

class EditFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(
      label: element.lable,
      content: Expanded(
        child: TextField(
          style: TextBlackContentStyle(),
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: InputBorder.none,
              hintStyle: TextHintContentStyle(),
              hintText: element.placeHolder == null ? "" : element.placeHolder),
        ),
      ),
    );
  }
}

class RadioBoxFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(
      label: element.lable,
      content: Text("RadioBox"),
    );
  }
}

class SwitchFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(
        label: element.lable,
        content: Container(
          color: Colors.red,
          height: 24,
          child: SwitchWidget(),
        ));
  }
}

class SwitchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwitchState();
}

class SwitchState extends State<SwitchWidget> {
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        activeColor: C.primary,
        value: _checked,
        onChanged: (newValue) {
          setState(() {
            _checked = newValue;
            print(_checked);
          });
        });
  }
}

class SelectViewFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class SoftTipFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class DateFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class LongTextFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class NumberFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class MoneyFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class InvoiceFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class AttachmentFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class CommBillFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class ApplyBudgetFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class CashAdvanceBudgetFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class SelectCityFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}

class SelectEmployeeFactory extends BizItemFactory {
  @override
  Widget buildWidget(BeanTemplateElement element) {
    return BizLeftRightWidget(label: element.lable);
  }
}
