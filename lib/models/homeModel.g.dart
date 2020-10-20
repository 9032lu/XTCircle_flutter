// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homeModel _$homeModelFromJson(Map<String, dynamic> json) {
  return homeModel(
    (json['cate'] as List)
        ?.map(
            (e) => e == null ? null : Cate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    // json['stick'] == null
    //     ? null
    //     : stickResultModel.fromJson(json['stick'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$homeModelToJson(homeModel instance) => <String, dynamic>{
      'cate': instance.cate,
      // 'stick': instance.stick,
    };
