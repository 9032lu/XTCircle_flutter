import 'package:json_annotation/json_annotation.dart';

part 'bannerModel.g.dart';

List<bannerModel> getbannerModelList(List<dynamic> list) {
  List<bannerModel> result = [];
  list.forEach((item) {
    result.add(bannerModel.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class bannerModel extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type_id')
  int typeId;

  @JsonKey(name: 'type_name')
  String typeName;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'location_url')
  String locationUrl;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'platform')
  String platform;

  @JsonKey(name: 'create_time')
  String createTime;

  @JsonKey(name: 'update_time')
  String updateTime;

  @JsonKey(name: 'is_delete')
  int isDelete;

  bannerModel(
    this.id,
    this.typeId,
    this.typeName,
    this.title,
    this.img,
    this.locationUrl,
    this.sort,
    this.platform,
    this.createTime,
    this.updateTime,
    this.isDelete,
  );

  factory bannerModel.fromJson(Map<String, dynamic> srcJson) =>
      _$bannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$bannerModelToJson(this);
}
