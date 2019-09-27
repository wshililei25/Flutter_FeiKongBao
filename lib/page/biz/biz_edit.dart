import 'package:flutter/material.dart';
import 'package:fkb3_flutter/bean/bean_template_info.dart';
import 'package:fkb3_flutter/bean/bean_template_element.dart';
import 'package:fkb3_flutter/utils/db_util.dart';
import 'biz_type.dart';
import 'package:fkb3_flutter/utils/toast.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/dialog/loading_dialog.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/bean/bean_simple_bill.dart';
import 'edit/biz_edit_factory.dart';

class BizEditPage extends StatefulWidget {
  final Map<String, String> bizType;
  final BeanSimpleBill bill;

  BizEditPage(this.bizType, this.bill);

  @override
  State<StatefulWidget> createState() => BizEditState();
}

///1.根据bizType获取模板数据[_initTemplate]，未得到时展示loading，得到后进入模板加载
///2.处理模板数据[_processTemplate]，给数据中加入分组标题
///
///
///
///
///
///
///
///
///
///
///
class BizEditState extends State<BizEditPage> {
  BeanTemplateInfo _templateInfo;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initTemplate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWhiteAppbar(widget.bizType[BizType.fullName]),
      ),
      body: _templateInfo == null ? LoadingDialog() : _buildBody(),
    );
  }

  ///加载模板
  _initTemplate() async {
    _templateInfo =
        await DBUtil.queryTemplate(widget.bizType[BizType.fullType]);
    if (_templateInfo != null) {
      _processTemplate();
      setState(() {});
    } else {
      Toast.show(context: context, msg: S.of(context).loadTemplateFail);
    }
  }

  ///处理模板数据
  _processTemplate() async {
    List<BeanTemplateElement> result = [];

    String tmpID = "";
    _templateInfo.elements.forEach((element) {
      if (tmpID.isEmpty || tmpID != element.groupID) {
        tmpID = element.groupID;
        BeanTemplateElement group = BeanTemplateElement(
            elementType: ElementType.GROUP_TITLE, groupName: element.groupName);
        result.add(group);
      }
      result.add(element);
    });
    _templateInfo.elements = result;
  }

  Widget _buildBody() {
    return ListView.builder(
      //当条目过少时listView某些嵌套情况下可能不会滚动（条目多时，超出一个屏幕，不会出现此问题），RefreshIndicator是根据下拉偏移量触发onRefresh操作，不能滚动自然不能下拉刷新
      physics: AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        BeanTemplateElement element = _templateInfo.elements[index];
        BizItemFactory factory = BizEditFactory.getFactory(element.elementType);
        if (factory == null) {
          return null;
        } else {
          return factory.buildWidget(element);
        }
      },
      itemCount:
          _templateInfo.elements == null ? 0 : _templateInfo.elements.length,
    );
  }
}
