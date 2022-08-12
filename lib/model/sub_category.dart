import 'dart:convert';

class SubCategory {
  SubCategory({
    required this.amountSpent,
    required this.subCategoryId,
    required this.subCategoryName,
  });

  final int amountSpent;
  final int subCategoryId;
  final String subCategoryName;

  SubCategory copyWith({
    int? amountSpent,
    int? subCategoryId,
    String? subCategoryName,
  }) =>
      SubCategory(
        amountSpent: amountSpent ?? this.amountSpent,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        subCategoryName: subCategoryName ?? this.subCategoryName,
      );

  factory SubCategory.fromRawJson(String str) =>
      SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        amountSpent: json["AmountSpent"],
        subCategoryId: json["SubCategoryId"],
        subCategoryName: json["SubCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "AmountSpent": amountSpent,
        "SubCategoryId": subCategoryId,
        "SubCategoryName": subCategoryName,
      };
}
