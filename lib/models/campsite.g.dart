// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CampsiteImpl _$$CampsiteImplFromJson(Map<String, dynamic> json) =>
    _$CampsiteImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      geoLocation: GeoLocation.fromJson(
        json['geoLocation'] as Map<String, dynamic>,
      ),
      isCloseToWater: json['isCloseToWater'] as bool,
      isCampFireAllowed: json['isCampFireAllowed'] as bool,
      hostLanguages: (json['hostLanguages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      photo: json['photo'] as String,
      suitableFor:
          (json['suitableFor'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CampsiteImplToJson(_$CampsiteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'geoLocation': instance.geoLocation,
      'isCloseToWater': instance.isCloseToWater,
      'isCampFireAllowed': instance.isCampFireAllowed,
      'hostLanguages': instance.hostLanguages,
      'pricePerNight': instance.pricePerNight,
      'photo': instance.photo,
      'suitableFor': instance.suitableFor,
    };

_$GeoLocationImpl _$$GeoLocationImplFromJson(Map<String, dynamic> json) =>
    _$GeoLocationImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$$GeoLocationImplToJson(_$GeoLocationImpl instance) =>
    <String, dynamic>{'lat': instance.lat, 'long': instance.lng};
