import 'package:json_annotation/json_annotation.dart';

part 'CompanyDetail.g.dart';

@JsonSerializable()
class CompanyDetail {
  DataBean? data;

  CompanyDetail({this.data});

  factory CompanyDetail.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailToJson(this);
}

@JsonSerializable()
class DataBean {
  List<String>? hasBenefits;
  List<String>? hasJobs;
  List<String>? hasLocations;
  String? id;
  String? companyName;
  String? companyNameEn;
  String? companySlug;
  String? employer_Id;
  OptionalDetailCompany_IdBean? optionalDetailCompany_Id;
  String? exactAddress;
  String? phoneNumber;
  num? viewCount;
  num? followerCount;
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
      this.exactAddress,
      this.phoneNumber,
      this.viewCount,
      this.followerCount,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class OptionalDetailCompany_IdBean {
  List<String>? companyPics;
  String? id;
  String? logoUrl;
  String? bannerUrl;
  String? companyAddress;
  String? contactName;
  String? companySize_Id;
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
