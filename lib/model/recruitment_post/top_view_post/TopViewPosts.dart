import 'package:json_annotation/json_annotation.dart';

part 'TopViewPosts.g.dart';

@JsonSerializable()
class TopViewPosts {
  List<DataBean>? data;

  TopViewPosts({this.data});

  factory TopViewPosts.fromJson(Map<String, dynamic> json) =>
      _$TopViewPostsFromJson(json);

  Map<String, dynamic> toJson() => _$TopViewPostsToJson(this);
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
  String? expiredTime;
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
      this.countView,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class LocationBean {
  String? type;
  String? id;
  List<num>? coordinates;

  LocationBean({this.type, this.id, this.coordinates});

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
