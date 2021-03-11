
import 'package:json_annotation/json_annotation.dart';

part 'Image.g.dart';


@JsonSerializable()
class ImageModelList {
  @JsonKey(name: "data")
  List<ImageModel> list;
  ImageModelList(this.list);

  factory ImageModelList.fromJson(Map<String, dynamic> json) => _$ImagesListFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesListToJson(this);
}

@JsonSerializable()
class ImageModel {
  @JsonKey(name: '')
  String url;

  ImageModel(
      this.url,
      );
  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}