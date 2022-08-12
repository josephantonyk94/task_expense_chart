// To parse this JSON data, do
//

import 'package:meta/meta.dart';
import 'dart:convert';

class CategoryRenspose {
  CategoryRenspose({
    required this.status,
    required this.message,
    required this.responseData,
  });

  final bool status;
  final String message;
  final List<Category> responseData;

  CategoryRenspose copyWith({
    bool? status,
    String? message,
    List<Category>? responseData,
  }) =>
      CategoryRenspose(
        status: status ?? this.status,
        message: message ?? this.message,
        responseData: responseData ?? this.responseData,
      );

  factory CategoryRenspose.fromRawJson(String str) =>
      CategoryRenspose.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryRenspose.fromJson(Map<String, dynamic> json) =>
      CategoryRenspose(
        status: json["status"],
        message: json["message"],
        responseData: List<Category>.from(
            json["responseData"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.amountSpent,
    required this.categoryId,
    required this.categoryName,
  });

  final int amountSpent;
  final int categoryId;
  final String categoryName;

  Category copyWith({
    int? amountSpent,
    int? categoryId,
    String? categoryName,
  }) =>
      Category(
        amountSpent: amountSpent ?? this.amountSpent,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        amountSpent: json["AmountSpent"],
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "AmountSpent": amountSpent,
        "CategoryId": categoryId,
        "CategoryName": categoryName,
      };
}
