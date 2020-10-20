import 'package:json_annotation/json_annotation.dart';
import 'stickResultModel.dart';
part 'homeModel.g.dart';

@JsonSerializable()
// ignore: camel_case_types
class homeModel extends Object {
  @JsonKey(name: 'cate')
  List<Cate> cate;

  // @JsonKey(name: 'stick')
  // stickResultModel stick;

  homeModel(
    this.cate,
    // this.stick,
  );

  factory homeModel.fromJson(Map<String, dynamic> srcJson) =>
      _$homeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$homeModelToJson(this);
}

// @JsonSerializable()
// class Cate extends Object {
//   @JsonKey(name: 'id')
//   int id;

//   @JsonKey(name: 'pid')
//   int pid;

//   @JsonKey(name: 'name')
//   String name;

//   @JsonKey(name: 'img')
//   String img;

//   @JsonKey(name: 'type')
//   int type;

//   @JsonKey(name: 'url')
//   String url;

//   @JsonKey(name: 'is_contact')
//   int isContact;

//   @JsonKey(name: 'sort')
//   int sort;

//   @JsonKey(name: 'create_time')
//   String createTime;

//   @JsonKey(name: 'update_time')
//   String updateTime;

//   @JsonKey(name: 'status')
//   int status;

//   @JsonKey(name: 'is_delete')
//   int isDelete;

//   @JsonKey(name: 'platform')
//   String platform;

//   Cate(
//     this.id,
//     this.pid,
//     this.name,
//     this.img,
//     this.type,
//     this.url,
//     this.isContact,
//     this.sort,
//     this.createTime,
//     this.updateTime,
//     this.status,
//     this.isDelete,
//     this.platform,
//   );

//   factory Cate.fromJson(Map<String, dynamic> srcJson) =>
//       _$CateFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$CateToJson(this);
// }

// @JsonSerializable()
// class Stick extends Object {
//   @JsonKey(name: 'total')
//   int total;

//   @JsonKey(name: 'per_page')
//   int perPage;

//   @JsonKey(name: 'current_page')
//   int currentPage;

//   @JsonKey(name: 'last_page')
//   int lastPage;

//   @JsonKey(name: 'data')
//   List<StickModel> data;

//   Stick(
//     this.total,
//     this.perPage,
//     this.currentPage,
//     this.lastPage,
//     this.data,
//   );

//   factory Stick.fromJson(Map<String, dynamic> srcJson) =>
//       _$StickFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$StickToJson(this);
// }

// @JsonSerializable()
// class StickModel extends Object {
//   @JsonKey(name: 'id')
//   int id;

//   @JsonKey(name: 'user_id')
//   int userId;

//   @JsonKey(name: 'cate_pid')
//   int catePid;

//   @JsonKey(name: 'cate_id')
//   int cateId;

//   @JsonKey(name: 'title')
//   String title;

//   @JsonKey(name: 'content')
//   String content;

//   @JsonKey(name: 'json_content')
//   List<Json_content> jsonContent;

//   @JsonKey(name: 'img')
//   List<String> img;

//   @JsonKey(name: 'video')
//   String video;

//   @JsonKey(name: 'contact_name')
//   String contactName;

//   @JsonKey(name: 'contact_phone')
//   String contactPhone;

//   @JsonKey(name: 'report_num')
//   int reportNum;

//   @JsonKey(name: 'read_num')
//   int readNum;

//   @JsonKey(name: 'phone_num')
//   int phoneNum;

//   @JsonKey(name: 'create_time')
//   String createTime;

//   @JsonKey(name: 'update_time')
//   String updateTime;

//   @JsonKey(name: 'top_time')
//   String topTime;

//   @JsonKey(name: 'refresh_time')
//   int refreshTime;

//   @JsonKey(name: 'is_hot')
//   int isHot;

//   @JsonKey(name: 'status')
//   int status;

//   @JsonKey(name: 'is_download')
//   int isDownload;

//   @JsonKey(name: 'is_delete')
//   int isDelete;

//   @JsonKey(name: 'reason')
//   String reason;

//   @JsonKey(name: 'platform')
//   String platform;

//   @JsonKey(name: 'stick_from')
//   int stickFrom;

//   @JsonKey(name: 'from_content')
//   String fromContent;

//   @JsonKey(name: 'parent_cate')
//   Parent_cate parentCate;

//   @JsonKey(name: 'cate')
//   Cate cate;

//   @JsonKey(name: 'user')
//   User user;

//   @JsonKey(name: 'time')
//   String time;

//   StickModel(
//     this.id,
//     this.userId,
//     this.catePid,
//     this.cateId,
//     this.title,
//     this.content,
//     this.jsonContent,
//     this.img,
//     this.video,
//     this.contactName,
//     this.contactPhone,
//     this.reportNum,
//     this.readNum,
//     this.phoneNum,
//     this.createTime,
//     this.updateTime,
//     this.topTime,
//     this.refreshTime,
//     this.isHot,
//     this.status,
//     this.isDownload,
//     this.isDelete,
//     this.reason,
//     this.platform,
//     this.stickFrom,
//     this.fromContent,
//     this.parentCate,
//     this.cate,
//     this.user,
//     this.time,
//   );

//   factory StickModel.fromJson(Map<String, dynamic> srcJson) =>
//       _$DataFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$DataToJson(this);
// }

// @JsonSerializable()
// class Json_content extends Object {
//   @JsonKey(name: 'type')
//   String type;

//   @JsonKey(name: 'value')
//   String value;

//   @JsonKey(name: 'index')
//   int index;

//   Json_content(
//     this.type,
//     this.value,
//     this.index,
//   );

//   factory Json_content.fromJson(Map<String, dynamic> srcJson) =>
//       _$Json_contentFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$Json_contentToJson(this);
// }

// @JsonSerializable()
// class Parent_cate extends Object {
//   @JsonKey(name: 'name')
//   String name;

//   Parent_cate(
//     this.name,
//   );

//   factory Parent_cate.fromJson(Map<String, dynamic> srcJson) =>
//       _$Parent_cateFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$Parent_cateToJson(this);
// }

// @JsonSerializable()
// class User extends Object {
//   @JsonKey(name: 'id')
//   int id;

//   @JsonKey(name: 'user_name')
//   String userName;

//   @JsonKey(name: 'avatar')
//   String avatar;

//   User(
//     this.id,
//     this.userName,
//     this.avatar,
//   );

//   factory User.fromJson(Map<String, dynamic> srcJson) =>
//       _$UserFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
