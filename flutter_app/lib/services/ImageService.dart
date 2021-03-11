import 'package:flutter_app/model/Image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ImagesService {
  Future<ImageModelList> getImage() async {
  var response = await http.get(
      "https://api.pexels.com/v1/search?query=people",
    headers: {
      "Authorization": "563492ad6f91700001000001cb7e23f42b824cb1925512b123793ad4"
    }
  );

  if (response.statusCode == 200) {
    var json = convert.jsonDecode(response.body);
    return ImageModelList.fromJson(json);
  } else {
  return null;
  }
  }
}