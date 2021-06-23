import 'package:json_annotation/json_annotation.dart';

part 'AllCategories.g.dart';

@JsonSerializable()
class AllCategories {
  num? total;
  List<DataBean>? data;

  AllCategories({this.total, this.data});

  factory AllCategories.fromJson(Map<String, dynamic> json) =>
      _$AllCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$AllCategoriesToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  String? jobCategory_Id;
  String? JobDetailName;
  String? JobDetailNameEn;
  num? scrapeId;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;

  DataBean(
      {this.id,
      this.jobCategory_Id,
      this.JobDetailName,
      this.JobDetailNameEn,
      this.scrapeId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
