import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'constant.dart';
import 'package:fkb3_flutter/bean/bean_employee.dart';
import 'package:fkb3_flutter/utils/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:fkb3_flutter/bean/bean_static_data.dart';
import 'package:fkb3_flutter/bean/bean_response_template_url.dart';
import 'package:fkb3_flutter/utils/file_util.dart';
import 'package:fkb3_flutter/utils/user_util.dart';
import 'package:fkb3_flutter/bean/bean_template_info.dart';
import 'package:fkb3_flutter/bean/bean_template_element.dart';
import 'dart:convert';
import 'package:fkb3_flutter/bean/bean_menu.dart';
import 'package:fkb3_flutter/bean/bean_response_login.dart';
import 'package:fkb3_flutter/utils/log_util.dart';

class DBUtil {
  static Database _db;

  static initDatabase() async {
    // Get a location using getDatabasesPath
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, Constant.databaseName);
    try {
      _db = await openDatabase(path, version: 2, onCreate: (db, version) {
        //创建表
        createTableSql.forEach((table, sql) async {
          await db.execute(sql);
        });
      });
    } catch (e) {
      Log.e("Error $e");
    }
  }

  static Future<int> insert(String table, Map<String, dynamic> data,
      {Transaction txn}) async {
    var result;
    if (txn != null) {
      result = await txn.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      result = await _db.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    Log.v("表$table 插入数据id：$result 数据：${data.toString()}");
    return result;
  }

  static Future<int> delete(String table) async {
    var result = await _db.delete(table);
    Log.v("表$table 删除数据：$result条");
    return result;
  }

  //插入用户信息
//  static Future<int> insertEmployee(BeanEmployee beanEmployee) async {
//    return insert(t_employee, beanEmployee.toJson());
//  }

  ///插入用户菜单
  static Future<int> insertMenu(BeanMenu menu) async {
    return insert(t_employee_menu, menu.toJson());
  }

  ///插入登录数据
  static Future<int> insertLoginData(BeanResponseLogin loginData) async {
    return _db.transaction<int>((txn) async {
      int employee =
          await insert(t_employee, loginData.employeeInfo.toJson(), txn: txn);
      if (employee > 0) {
        UserUtil.setLegalUnitID(loginData.employeeInfo.legalUnitID);
      }
      int menuId = 0;
      if (loginData.menus != null && loginData.menus.length > 0) {
        for (int i = 0; i < loginData.menus.length; i++) {
          BeanMenu menu = loginData.menus[i];
          int n = await insert(t_employee_menu, menu.toJson(), txn: txn);
          menuId += n;
        }
      }
      if (employee <= 0) {
        return 0;
      } else if (menuId <= 0) {
        return -1;
      } else {
        return 1;
      }
    });
  }

  ///插入基础数据
  static Future<int> insertStaticData(BeanStaticData staticData,
      {Transaction txn}) async {
    return insert(t_static_data, staticData.toJson(), txn: txn);
  }

  ///插入模板基础信息
  static Future<int> insertTemplateInfo(BeanTemplateInfo staticData) async {
    return insert(t_template_info, staticData.toJson());
  }

  ///插入模板元素
  static Future<int> insertTemplateElement(
      BeanTemplateElement staticData) async {
    return insert(t_template_element, staticData.toJson());
  }

  ///查询模板
  static Future<BeanTemplateInfo> queryTemplate(String templateID) async {
    Map<String, dynamic> info;
    List<Map<String, dynamic>> infoList =
        await _db.query(t_template_info, where: "templateID='$templateID'");
    if (infoList == null || infoList.isEmpty) {
      return null;
    }
    //复制Map以便可以修改，直接查询出来的是不能修改的
    info = Map.from(infoList[0]);

    List<Map<String, dynamic>> elementList = await _db.query(t_template_element,
        where: "templateID='$templateID'", orderBy: "orderBy");
    if (infoList == null || infoList.isEmpty) {
      return null;
    }
    info["elements"] = elementList;
    BeanTemplateInfo beanTemplateInfo = BeanTemplateInfo.fromJson(info);
    return beanTemplateInfo;
  }

  ///加载基础数据
  static void loadStaticData(BuildContext context) async {
    var list = await ApiManager.loadStaticData();
    if (list == null || list.isEmpty) return;
    _db.transaction<int>((txn) async {
      Log.d("插入基础数据开始：${DateTime.now().toIso8601String()}");
      list.forEach((item) async {
        await insertStaticData(item, txn: txn);
      });
      Log.d("插入基础数据结束：${DateTime.now().toIso8601String()}");
    });
    loadTemplateFile();
  }

  ///加载动态单据模板文件
  static void loadTemplateFile() async {
    var list = await ApiManager.loadAllBillTemplate();
    if (list == null || list.isEmpty) return;
    Log.d("加载单据模板开始：${DateTime.now().toIso8601String()}");
    list.forEach((item) {
      BeanResponseTemplateUrl url = item;
      Log.v(url.templateUrl);
      FileUtil.downloadFile(
          "${UserUtil.getUserBaseUrl()}/api${url.templateUrl}",
          callback: (result) {
        var data = json.decode(result);
        BeanTemplateInfo templateInfo = BeanTemplateInfo.fromJson(data);
        if (templateInfo.templateID == null ||
            templateInfo.templateID.isEmpty) {
          Log.d(result);
        } else {
          insertTemplateInfo(templateInfo);
          Log.d(
              "插入模板 ${templateInfo.templateName}：${templateInfo.templateID} => ${DateTime.now().toIso8601String()}");
          if (templateInfo.elements != null &&
              templateInfo.elements.isNotEmpty) {
            templateInfo.elements.forEach((element) {
              element.templateID = templateInfo.templateID;
              insertTemplateElement(element);
            });
          }
        }
      });
    });
  }

  static Future<BeanEmployee> queryEmployee() async {
    var employees = await _db.query(t_employee);
    if (employees == null || employees.isEmpty) {
      return null;
    } else {
      Map<String, dynamic> data = Map<String, dynamic>.from(employees[0]);
      BeanEmployee employee = BeanEmployee.fromJson(data);
      return employee;
    }
  }

  static Future<List<BeanMenu>> queryMenus() async {
    var menus = await _db.query(
      t_employee_menu,
      orderBy: "GroupCode and OrderBy",
    );
    if (menus == null || menus.isEmpty) {
      return null;
    } else {
      List<BeanMenu> list = [];
      menus.forEach((data) {
        BeanMenu menu = BeanMenu.fromJson(data);
        list.add(menu);
      });
      return list;
    }
  }

  static Future<int> clearData() async {
    createTableSql.forEach((key, value) async {
      await delete(key);
    });
    return 0;
  }
}

///用户信息表
const t_employee = "t_employee";

///用户菜单
const t_employee_menu = "t_employee_menu";

///基础数据表
const t_static_data = "t_static_data";

///单据模板基础信息表
const t_template_info = "t_template_info";

///单据模板元素表
const t_template_element = "t_template_element";

const createTableSql = {
  t_employee: """
      CREATE TABLE "t_employee" (
      `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
      `Bank`	TEXT,
      `BankCard`	TEXT,
      `CarCard`	TEXT,
      `CellPhone`	TEXT,
      `CompanyCode`	TEXT,
      `CompanyName`	TEXT,
      `CostCenterCD`	TEXT,
      `CostCenterID`	TEXT,
      `CostCenterName`	TEXT,
      `Email`	TEXT,
      `EmployeeID`	TEXT,
      `EmployeeName`	TEXT,
      `EmployeePhoto`	TEXT,
      `Fax`	TEXT,
      `IDCard`	TEXT,
      `LegalUnitID`	TEXT,
      `OfficePhone`	TEXT,
      `PassportCard`	TEXT,
      `Post`	TEXT,
      `BirthdayStr`	TEXT,
      `LinkAccountID`	TEXT
    );
  """,
  t_employee_menu: """
      CREATE TABLE "t_employee_menu" (
      `Code`	TEXT,
      `CompanyGUID`	TEXT,
      `GroupName`	TEXT,
      `GroupNameEN`	TEXT,
      `Icon`	TEXT,
      `IconName`	TEXT,
      `IconNameEN`	TEXT,
      `MenuID`	TEXT NOT NULL PRIMARY KEY,
      `GroupCode`	TEXT,
      `RelateMenuID`	TEXT,
      `Url`	TEXT,
      `IconPath`	TEXT,
      `OrderBy`	INTEGER,
      `Type`	INTEGER,
      `EditFlag`	INTEGER,
      `IsActive`	INTEGER
    );
  """,
  t_static_data: """
      CREATE TABLE "t_static_data" (
      `staticType`	INTEGER,
      `staticName`	TEXT,
      `staticEnName`	TEXT,
      `staticID`	TEXT NOT NULL,
      `staticCD`	TEXT,
      `staticLogo`	TEXT,
      `legalUnitID`	TEXT,
      `orgID`	TEXT,
      `extra1`	TEXT,
      `extra2`	TEXT,
      `extra3`	TEXT,
      `dimension1`	TEXT,
      `dimension2`	TEXT,
      `dimension3`	TEXT,
      `isDefault`	INTEGER,
      PRIMARY KEY (`staticID`, `staticType`)
    );
  """,
  t_template_info: """
      CREATE TABLE "t_template_info" (
      `templateID`	TEXT NOT NULL PRIMARY KEY,
      `templateVersion`	TEXT,
      `templateName`	TEXT,
      `simpleName`	TEXT,
      `templateType`	TEXT,
      `simpleType`	TEXT,
      `saveSuccessKey`	TEXT,
      `saveFailKey`	TEXT,
      `saveUrl`	TEXT,
      `submitUrl`	TEXT,
      `legalUnitID`	TEXT,
      `intKey`	TEXT,
      `pageLevel`	INTEGER,
      `documentType`	INTEGER,
      `docBusinessType`	INTEGER,
      `saveRequestType`	INTEGER
    );
  """,
  t_template_element: """
      CREATE TABLE "t_template_element" (
      `id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
      `lable`	TEXT,
      `lableEn`	TEXT,
      `placeHolder`	TEXT,
      `placeHolderEn`	TEXT,
      `groupID`	TEXT,
      `groupName`	TEXT,
      `groupNameEn`	TEXT,
      `key`	TEXT,
      `dataPrecision`	TEXT,
      `templateID`	TEXT,
      `elementType`	INTEGER,
      `roundType`	INTEGER,
      `maxLength`	INTEGER,
      `orderBy`	INTEGER,
      `readOnly`	INTEGER,
      FOREIGN KEY(templateID) REFERENCES t_template_info(templateID)
    );
  """
};
