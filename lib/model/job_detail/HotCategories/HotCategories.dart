import 'package:json_annotation/json_annotation.dart';

part 'HotCategories.g.dart';

@JsonSerializable()
class HotCategories {
  List<DataBean>? data;
  num? total;

  HotCategories({this.data, this.total});

  factory HotCategories.fromJson(Map<String, dynamic> json) =>
      _$HotCategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$HotCategoriesToJson(this);
}

@JsonSerializable()
class DataBean {
  DetailBean? detail;
  num? countTotal;

  DataBean({this.detail, this.countTotal});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class DetailBean {
  String? id;
  JobCategory_IdBean? jobCategory_Id;
  String? JobDetailName;
  String? JobDetailNameEn;
  num? scrapeId;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;

  DetailBean(
      {this.id,
      this.jobCategory_Id,
      this.JobDetailName,
      this.JobDetailNameEn,
      this.scrapeId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory DetailBean.fromJson(Map<String, dynamic> json) =>
      _$DetailBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DetailBeanToJson(this);
}

@JsonSerializable()
class JobCategory_IdBean {
  String? id;
  String? jobCategoryName;
  String? jobCategoryNameEn;
  num? scrapeId;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;

  JobCategory_IdBean(
      {this.id,
      this.jobCategoryName,
      this.jobCategoryNameEn,
      this.scrapeId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory JobCategory_IdBean.fromJson(Map<String, dynamic> json) =>
      _$JobCategory_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$JobCategory_IdBeanToJson(this);
}
