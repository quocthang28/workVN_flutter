// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    coord: json['coord'] == null
        ? null
        : CoordBean.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List<dynamic>?)
        ?.map((e) => WeatherBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    base: json['base'] as String?,
    main: json['main'] == null
        ? null
        : MainBean.fromJson(json['main'] as Map<String, dynamic>),
    wind: json['wind'] == null
        ? null
        : WindBean.fromJson(json['wind'] as Map<String, dynamic>),
    clouds: json['clouds'] == null
        ? null
        : CloudsBean.fromJson(json['clouds'] as Map<String, dynamic>),
    dt: json['dt'] as num?,
    sys: json['sys'] == null
        ? null
        : SysBean.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as num?,
    id: json['_id'] as num?,
    name: json['name'] as String?,
    cod: json['cod'] as num?,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

SysBean _$SysBeanFromJson(Map<String, dynamic> json) {
  return SysBean(
    type: json['type'] as num?,
    id: json['_id'] as num?,
    message: json['message'] as num?,
    country: json['country'] as String?,
    sunrise: json['sunrise'] as num?,
    sunset: json['sunset'] as num?,
  );
}

Map<String, dynamic> _$SysBeanToJson(SysBean instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'message': instance.message,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

CloudsBean _$CloudsBeanFromJson(Map<String, dynamic> json) {
  return CloudsBean(
    all: json['all'] as num?,
  );
}

Map<String, dynamic> _$CloudsBeanToJson(CloudsBean instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

WindBean _$WindBeanFromJson(Map<String, dynamic> json) {
  return WindBean(
    speed: json['speed'] as num?,
    deg: json['deg'] as num?,
  );
}

Map<String, dynamic> _$WindBeanToJson(WindBean instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

MainBean _$MainBeanFromJson(Map<String, dynamic> json) {
  return MainBean(
    temp: json['temp'] as num?,
    feels_like: json['feels_like'] as num?,
    temp_min: json['temp_min'] as num?,
    temp_max: json['temp_max'] as num?,
    pressure: json['pressure'] as num?,
    humidity: json['humidity'] as num?,
  );
}

Map<String, dynamic> _$MainBeanToJson(MainBean instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

WeatherBean _$WeatherBeanFromJson(Map<String, dynamic> json) {
  return WeatherBean(
    id: json['_id'] as num?,
    main: json['main'] as String?,
    description: json['description'] as String?,
    icon: json['icon'] as String?,
  );
}

Map<String, dynamic> _$WeatherBeanToJson(WeatherBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

CoordBean _$CoordBeanFromJson(Map<String, dynamic> json) {
  return CoordBean(
    lon: json['lon'] as num?,
    lat: json['lat'] as num?,
  );
}

Map<String, dynamic> _$CoordBeanToJson(CoordBean instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
