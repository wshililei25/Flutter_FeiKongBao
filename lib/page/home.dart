import 'package:flutter/material.dart';
import 'package:fkb3_flutter/utils/constant.dart';
import 'todo.dart';
import 'work.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/utils/user_util.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _index = 1;

  HomeState();

  Widget _buildPage(int index) {
    if (index == 0) {
      return TodoPage();
    } else if (index == 1) {
      return WorkPage();
    }
    return Text("找不到页面");
  }

  void _logOut() {
    UserUtil.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _logOut,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: _buildPage(_index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: C.primary,
        unselectedItemColor: C.textContentThird,
        currentIndex: _index,
        onTap: (tapIndex) {
          setState(() {
            this._index = tapIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.today,
              ),
              title: Text(S.of(context).todo)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
              ),
              title: Text(S.of(context).workbench))
        ],
      ),
//        bottomNavigationBar: Material(
//          color: C.background,
//          child: SafeArea(
//            child: Container(
//              height: ScreenUtil().setHeight(H.homeBottomBar),
//              decoration: BoxDecoration(
//                color: const Color(0xFFF0F0F0),
//                boxShadow: <BoxShadow>[
//                  BoxShadow(
//                    color: C.shadow,
//                    blurRadius: R.large,
//                    spreadRadius: R.normal,
//                    offset: Offset(-1.0, -1.0),
//                  ),
//                ],
//              ),
//              child: TabBar(
//                  controller: controller,
//                  indicator: null,
////                  indicatorColor: Theme.of(context).primaryColor,
//                  //tab标签的下划线颜色
//                  // labelColor: const Color(0xFF000000),
////                  indicatorWeight: 3.0,
//                  labelColor: C.primary,
//                  unselectedLabelColor: C.textHintColor,
//                  tabs: tabWidgets),
//            ),
//          ),
//        ),
    );
  }
}
