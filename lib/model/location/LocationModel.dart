import 'package:json_annotation/json_annotation.dart';

part 'LocationModel.g.dart';

@JsonSerializable()
class LocationModel {
  CoordBean? coord;
  List<WeatherBean>? weather;
  String? base;
  MainBean? main;
  WindBean? wind;
  CloudsBean? clouds;
  num? dt;
  SysBean? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  LocationModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class SysBean {
  num? type;
  num? id;
  num? message;
  String? country;
  num? sunrise;
  num? sunset;

  SysBean(
      {this.type,
      this.id,
      this.message,
      this.country,
      this.sunrise,
      this.sunset});

  factory SysBean.fromJson(Map<String, dynamic> json) =>
      _$SysBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SysBeanToJson(this);
}

@JsonSerializable()
class CloudsBean {
  num? all;

  CloudsBean({this.all});

  factory CloudsBean.fromJson(Map<String, dynamic> json) =>
      _$CloudsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsBeanToJson(this);
}

@JsonSerializable()
class WindBean {
  num? speed;
  num? deg;

  WindBean({this.speed, this.deg});

  factory WindBean.fromJson(Map<String, dynamic> json) =>
      _$WindBeanFromJson(json);

  Map<String, dynamic> toJson() => _$WindBeanToJson(this);
}

@JsonSerializable()
class MainBean {
  num? temp;
  num? feels_like;
  num? temp_min;
  num? temp_max;
  num? pressure;
  num? humidity;

  MainBean(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainBean.fromJson(Map<String, dynamic> json) =>
      _$MainBeanFromJson(json);

  Map<String, dynamic> toJson() => _$MainBeanToJson(this);
}

@JsonSerializable()
class WeatherBean {
  num? id;
  String? main;
  String? description;
  String? icon;

  WeatherBean({this.id, this.main, this.description, this.icon});

  factory WeatherBean.fromJson(Map<String, dynamic> json) =>
      _$WeatherBeanFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherBeanToJson(this);
}

@JsonSerializable()
class CoordBean {
  num? lon;
  num? lat;

  CoordBean({this.lon, this.lat});

  factory CoordBean.fromJson(Map<String, dynamic> json) =>
      _$CoordBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CoordBeanToJson(this);
}
