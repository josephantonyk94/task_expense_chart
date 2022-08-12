import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task_expense_chart/model/category.dart';

import 'model/sub_category.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Category> categoryList = [];
  List<SubCategory> subCategoryList = [];

  bool loadingPage = false;

  getCategoryData() async {
    loadingPage = true;
    Response response = await Dio().post(
        "http://65.1.73.181:3001/api/v1.0/master/CategoryStatistics",
        data: {"FromDate": "2021-06-09", "ToDate": "2021-06-12"});
    print(response.data);
    categoryList = List<Category>.from(
        (response.data["responseData"]).map((x) => Category.fromJson(x)));
    loadingPage = false;
    notifyListeners();
  }

  getSubCategoryData(int categoryId) async {
    Response response = await Dio().post(
        "http://65.1.73.181:3001/api/v1.0/master/SubCategoryStatistics",
        data: {
          "FromDate": "2021-06-09",
          "ToDate": "2021-06-12",
          "CategoryId": "$categoryId"
        });
    print(response.data);

    subCategoryList = List<SubCategory>.from(
        (response.data["responseData"]).map((x) => SubCategory.fromJson(x)));
    notifyListeners();
  }

  // getExpenseData() async {
  //   Response response = await Dio().get(
  //     "http://65.1.73.181:3001/api/v1.0/master/ExpenseList",
  //   );
  //   print(response.data);
  // }
}
