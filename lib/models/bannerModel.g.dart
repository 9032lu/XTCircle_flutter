// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

bannerModel _$bannerModelFromJson(Map<String, dynamic> json) {
  return bannerModel(
    json['id'] as int,
    json['type_id'] as int,
    json['type_name'] as String,
    json['title'] as String,
    json['img'] as String,
    json['location_url'] as String,
    json['sort'] as int,
    json['platform'] as String,
    json['create_time'] as String,
    json['update_time'] as String,
    json['is_delete'] as int,
  );
}

Map<String, dynamic> _$bannerModelToJson(bannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_id': instance.typeId,
      'type_name': instance.typeName,
      'title': instance.title,
      'img': instance.img,
      'location_url': instance.locationUrl,
      'sort': instance.sort,
      'platform': instance.platform,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'is_delete': instance.isDelete,
    };
