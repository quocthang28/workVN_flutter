import 'package:json_annotation/json_annotation.dart';

part 'CompanyPost.g.dart';

@JsonSerializable()
class CompanyPost {
  num? total;
  List<DataBean>? data;

  CompanyPost({this.total, this.data});

  factory CompanyPost.fromJson(Map<String, dynamic> json) =>
      _$CompanyPostFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyPostToJson(this);
}

@JsonSerializable()
class DataBean {
  LanguageRequiredBean? languageRequired;
  List<String>? hasLocations;
  List<String>? hasJobs;
  List<String>? requiredSkills;
  String? id;
  String? jobTitle;
  String? aliasPost;
  String? jobType;
  String? jobLevel_Id;
  String? company_Id;
  String? salaryRange_Id;
  bool? isRequiredCoverLetter;
  LocationBean? location;
  String? jobDescription;
  String? jobRequirement;
  String? contactPersonName;
  String? contactEmail;
  num? expiredTime;
  num? publishedDate;
  num? countView;
  num? v;

  DataBean(
      {this.languageRequired,
      this.hasLocations,
      this.hasJobs,
      this.requiredSkills,
      this.id,
      this.jobTitle,
      this.aliasPost,
      this.jobType,
      this.jobLevel_Id,
      this.company_Id,
      this.salaryRange_Id,
      this.isRequiredCoverLetter,
      this.location,
      this.jobDescription,
      this.jobRequirement,
      this.contactPersonName,
      this.contactEmail,
      this.expiredTime,
      this.publishedDate,
      this.countView,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class LocationBean {
  String? type;
  List<num>? coordinates;
  String? id;

  LocationBean({this.type, this.coordinates, this.id});

  factory LocationBean.fromJson(Map<String, dynamic> json) =>
      _$LocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBeanToJson(this);
}

@JsonSerializable()
class LanguageRequiredBean {
  String? language;
  String? proficiency;

  LanguageRequiredBean({this.language, this.proficiency});

  factory LanguageRequiredBean.fromJson(Map<String, dynamic> json) =>
      _$LanguageRequiredBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageRequiredBeanToJson(this);
}
