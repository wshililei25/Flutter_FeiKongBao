import 'package:flutter/material.dart';

abstract class BizListFactory {
  List<Widget> buildBillListWidget(Map bizType);
}
