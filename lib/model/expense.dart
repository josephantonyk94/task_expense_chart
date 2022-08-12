// To parse this JSON data, do
//
//     final expenceRenspose = expenceRensposeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ExpenceRenspose {
  ExpenceRenspose({
    required this.status,
    required this.message,
    required this.responseData,
  });

  final bool status;
  final String message;
  final List<Expense> responseData;

  ExpenceRenspose copyWith({
    bool? status,
    String? message,
    List<Expense>? responseData,
  }) =>
      ExpenceRenspose(
        status: status ?? this.status,
        message: message ?? this.message,
        responseData: responseData ?? this.responseData,
      );

  factory ExpenceRenspose.fromRawJson(String str) =>
      ExpenceRenspose.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpenceRenspose.fromJson(Map<String, dynamic> json) =>
      ExpenceRenspose(
        status: json["status"],
        message: json["message"],
        responseData: List<Expense>.from(
            json["responseData"].map((x) => Expense.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
      };
}

class Expense {
  Expense({
    required this.customerExpenseId,
    required this.customerId,
    required this.categoryId,
    required this.subCategoryId,
    required this.amountSpent,
    required this.expenseDate,
    required this.isDeleted,
    required this.name,
    required this.phone,
    required this.email,
    required this.categoryName,
    required this.subCategoryName,
  });

  final int customerExpenseId;
  final int customerId;
  final int categoryId;
  final int subCategoryId;
  final int amountSpent;
  final DateTime expenseDate;
  final int isDeleted;
  final String name;
  final String phone;
  final String email;
  final String categoryName;
  final String subCategoryName;

  Expense copyWith({
    int? customerExpenseId,
    int? customerId,
    int? categoryId,
    int? subCategoryId,
    int? amountSpent,
    DateTime? expenseDate,
    int? isDeleted,
    String? name,
    String? phone,
    String? email,
    String? categoryName,
    String? subCategoryName,
  }) =>
      Expense(
        customerExpenseId: customerExpenseId ?? this.customerExpenseId,
        customerId: customerId ?? this.customerId,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        amountSpent: amountSpent ?? this.amountSpent,
        expenseDate: expenseDate ?? this.expenseDate,
        isDeleted: isDeleted ?? this.isDeleted,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        categoryName: categoryName ?? this.categoryName,
        subCategoryName: subCategoryName ?? this.subCategoryName,
      );

  factory Expense.fromRawJson(String str) => Expense.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        customerExpenseId: json["CustomerExpenseId"],
        customerId: json["CustomerId"],
        categoryId: json["CategoryId"],
        subCategoryId: json["SubCategoryId"],
        amountSpent: json["AmountSpent"],
        expenseDate: DateTime.parse(json["ExpenseDate"]),
        isDeleted: json["IsDeleted"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
        categoryName: json["CategoryName"],
        subCategoryName: json["SubCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerExpenseId": customerExpenseId,
        "CustomerId": customerId,
        "CategoryId": categoryId,
        "SubCategoryId": subCategoryId,
        "AmountSpent": amountSpent,
        "ExpenseDate": expenseDate.toIso8601String(),
        "IsDeleted": isDeleted,
        "Name": name,
        "Phone": phone,
        "Email": email,
        "CategoryName": categoryName,
        "SubCategoryName": subCategoryName,
      };
}
