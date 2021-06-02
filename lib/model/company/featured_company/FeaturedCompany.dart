import 'package:json_annotation/json_annotation.dart';

part 'FeaturedCompany.g.dart';

@JsonSerializable()
class FeaturedCompany {
  num? total;
  List<DataBean>? data;

  FeaturedCompany({this.total, this.data});

  factory FeaturedCompany.fromJson(Map<String, dynamic> json) =>
      _$FeaturedCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedCompanyToJson(this);
}

@JsonSerializable()
class DataBean {
  List<HasBenefitsBean>? hasBenefits;
  List<HasJobsBean>? hasJobs;
  List<HasLocationsBean>? hasLocations;
  String? id;
  String? companyName;
  String? companyNameEn;
  String? companySlug;
  String? employer_Id;
  OptionalDetailCompany_IdBean? optionalDetailCompany_Id;
  String? phoneNumber;
  num? viewCount;
  num? followerCount;
  num? scrapeId;
  String? createdAt;
  String? updatedAt;
  num? v;

  DataBean(
      {this.hasBenefits,
      this.hasJobs,
      this.hasLocations,
      this.id,
      this.companyName,
      this.companyNameEn,
      this.companySlug,
      this.employer_Id,
      this.optionalDetailCompany_Id,
      this.phoneNumber,
      this.viewCount,
      this.followerCount,
      this.scrapeId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class OptionalDetailCompany_IdBean {
  dynamic? companyPics;
  String? id;
  String? logoUrl;
  String? bannerUrl;
  String? companyAddress;
  String? contactName;
  CompanySize_IdBean? companySize_Id;
  num? v;

  OptionalDetailCompany_IdBean(
      {this.companyPics,
      this.id,
      this.logoUrl,
      this.bannerUrl,
      this.companyAddress,
      this.contactName,
      this.companySize_Id,
      this.v});

  factory OptionalDetailCompany_IdBean.fromJson(Map<String, dynamic> json) =>
      _$OptionalDetailCompany_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalDetailCompany_IdBeanToJson(this);
}

@JsonSerializable()
class CompanySize_IdBean {
  String? id;
  String? companySize;
  num? v;

  CompanySize_IdBean({this.id, this.companySize, this.v});

  factory CompanySize_IdBean.fromJson(Map<String, dynamic> json) =>
      _$CompanySize_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CompanySize_IdBeanToJson(this);
}

@JsonSerializable()
class HasLocationsBean {
  String? id;
  String? provinceName;
  num? fakeId;
  num? v;

  HasLocationsBean({this.id, this.provinceName, this.fakeId, this.v});

  factory HasLocationsBean.fromJson(Map<String, dynamic> json) =>
      _$HasLocationsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HasLocationsBeanToJson(this);
}

@JsonSerializable()
class HasJobsBean {
  String? id;
  String? jobCategory_Id;
  String? JobDetailName;
  String? JobDetailNameEn;
  num? scrapeId;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;

  HasJobsBean(
      {this.id,
      this.jobCategory_Id,
      this.JobDetailName,
      this.JobDetailNameEn,
      this.scrapeId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory HasJobsBean.fromJson(Map<String, dynamic> json) =>
      _$HasJobsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HasJobsBeanToJson(this);
}

@JsonSerializable()
class HasBenefitsBean {
  String? id;
  String? benefitName;
  String? benefitNameEn;
  String? description;
  num? scrapeId;
  String? createdAt;
  String? updatedAt;
  num? v;

  HasBenefitsBean(
      {this.id,
      this.benefitName,
      this.benefitNameEn,
      this.description,
      this.scrapeId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory HasBenefitsBean.fromJson(Map<String, dynamic> json) =>
      _$HasBenefitsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HasBenefitsBeanToJson(this);
}
