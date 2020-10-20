// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stickResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

stickResultModel _$stickResultModelFromJson(Map<String, dynamic> json) {
  return stickResultModel(
    json['total'] as int,
    json['per_page'] as int,
    json['current_page'] as String,
    json['last_page'] as int,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : StickModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
// (json['json_content'] as List)
//         ?.map((e) =>
//             e == null ? null : Json_content.fromJson(e as Map<String, dynamic>))
//         ?.toList(),
  );
}

Map<String, dynamic> _$stickResultModelToJson(stickResultModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'data': instance.data,
    };

StickModel _$StickModelFromJson(Map<String, dynamic> json) {
  return StickModel(
    json['id'] as int,
    json['user_id'] as int,
    json['cate_pid'] as int,
    json['cate_id'] as int,
    json['title'] as String,
    json['content'] as String,
    (json['json_content'] as List)
        ?.map((e) =>
            e == null ? null : Json_content.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['img'] as List)?.map((e) => e as String)?.toList(),
    json['video'] as String,
    json['contact_name'] as String,
    json['contact_phone'] as String,
    json['report_num'] as int,
    json['read_num'] as int,
    json['phone_num'] as int,
    json['create_time'] as String,
    json['update_time'] as String,
    json['top_time'] as String,
    json['refresh_time'] as int,
    json['is_hot'] as int,
    json['status'] as int,
    json['is_download'] as int,
    json['is_delete'] as int,
    json['reason'] as String,
    json['platform'] as String,
    json['stick_from'] as int,
    json['from_content'] as String,
    json['parent_cate'] == null
        ? null
        : Parent_cate.fromJson(json['parent_cate'] as Map<String, dynamic>),
    json['cate'] == null
        ? null
        : Cate.fromJson(json['cate'] as Map<String, dynamic>),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['time'] as String,
  );
}

Map<String, dynamic> _$StickModelToJson(StickModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'cate_pid': instance.catePid,
      'cate_id': instance.cateId,
      'title': instance.title,
      'content': instance.content,
      'json_content': instance.jsonContent,
      'img': instance.img,
      'video': instance.video,
      'contact_name': instance.contactName,
      'contact_phone': instance.contactPhone,
      'report_num': instance.reportNum,
      'read_num': instance.readNum,
      'phone_num': instance.phoneNum,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'top_time': instance.topTime,
      'refresh_time': instance.refreshTime,
      'is_hot': instance.isHot,
      'status': instance.status,
      'is_download': instance.isDownload,
      'is_delete': instance.isDelete,
      'reason': instance.reason,
      'platform': instance.platform,
      'stick_from': instance.stickFrom,
      'from_content': instance.fromContent,
      'parent_cate': instance.parentCate,
      'cate': instance.cate,
      'user': instance.user,
      'time': instance.time,
    };

Json_content _$Json_contentFromJson(Map<String, dynamic> json) {
  return Json_content(
    json['index'] as int,
    json['type'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$Json_contentToJson(Json_content instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      'value': instance.value,
    };

Parent_cate _$Parent_cateFromJson(Map<String, dynamic> json) {
  return Parent_cate(
    json['name'] as String,
  );
}

Map<String, dynamic> _$Parent_cateToJson(Parent_cate instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Cate _$CateFromJson(Map<String, dynamic> json) {
  return Cate(
    json['name'] as String,
    json['img'] as String,
  );
}

Map<String, dynamic> _$CateToJson(Cate instance) =>
    <String, dynamic>{'name': instance.name, 'img': instance.img};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['user_name'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'avatar': instance.avatar,
    };
