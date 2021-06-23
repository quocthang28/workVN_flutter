import 'package:json_annotation/json_annotation.dart';

part 'SalaryRange.g.dart';

@JsonSerializable()
class SalaryRange {
  num? total;
  List<DataBean>? data;

  SalaryRange({this.total, this.data});

  factory SalaryRange.fromJson(Map<String, dynamic> json) =>
      _$SalaryRangeFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryRangeToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  num? salaryMin;
  num? salaryMax;
  bool? isShowUp;
  num? v;

  DataBean({this.id, this.salaryMin, this.salaryMax, this.isShowUp, this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
