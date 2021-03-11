part of 'Image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModelList _$ImagesListFromJson(Map<String, dynamic> json) {
  return ImageModelList((json['photos'] as List)
      ?.map(
          (e) => e == null ? null : ImageModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ImagesListToJson(ImageModelList instance) =>
    <String, dynamic>{'photos': instance.list};


ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {


  return ImageModel(
    json['src']['original'] as String,
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,

    };