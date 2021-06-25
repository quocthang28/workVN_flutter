import 'package:json_annotation/json_annotation.dart';

part 'JobType.g.dart';

@JsonSerializable()
class JobType {
  num? total;
  List<DataBean>? data;

  JobType({this.total, this.data});

  factory JobType.fromJson(Map<String, dynamic> json) =>
      _$JobTypeFromJson(json);

  Map<String, dynamic> toJson() => _$JobTypeToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  String? jobTypeName;
  num? scrapeId;
  num? v;

  DataBean({this.id, this.jobTypeName, this.scrapeId, this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
