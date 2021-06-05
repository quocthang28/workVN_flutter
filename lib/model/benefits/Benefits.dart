import 'package:json_annotation/json_annotation.dart';

part 'Benefits.g.dart';

@JsonSerializable()
class Benefits {
  num? total;
  List<DataBean>? data;

  Benefits({this.total, this.data});

  factory Benefits.fromJson(Map<String, dynamic> json) =>
      _$BenefitsFromJson(json);

  Map<String, dynamic> toJson() => _$BenefitsToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  String? benefitName;
  String? benefitNameEn;
  num? scrapeId;
  String? createdAt;
  String? updatedAt;
  num? v;

  DataBean(
      {this.id,
      this.benefitName,
      this.benefitNameEn,
      this.scrapeId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
