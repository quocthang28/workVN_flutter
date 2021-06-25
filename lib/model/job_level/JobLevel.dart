import 'package:json_annotation/json_annotation.dart';

part 'JobLevel.g.dart';

@JsonSerializable()
class JobLevel {
  num? total;
  List<DataBean>? data;

  JobLevel({this.total, this.data});

  factory JobLevel.fromJson(Map<String, dynamic> json) =>
      _$JobLevelFromJson(json);

  Map<String, dynamic> toJson() => _$JobLevelToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  String? jobLevelName;
  String? jobLevelNameEn;
  num? scrapeId;
  String? createdAt;
  String? updatedAt;
  num? v;

  DataBean(
      {this.id,
      this.jobLevelName,
      this.jobLevelNameEn,
      this.scrapeId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
