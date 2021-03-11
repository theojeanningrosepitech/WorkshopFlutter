import 'package:flutter/cupertino.dart';
import 'package:snaplist/snaplist_view.dart';
import 'package:snaplist/snaplist.dart';
import 'model/Image.dart';

class ListPictures extends StatelessWidget {
  ImageModelList images;
  ListPictures({this.images});

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(300.0, 460.0);
    return SnapList(
      padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width - cardSize.width) / 2),
      sizeProvider: (index, data) => cardSize,
      separatorProvider: (index, data) => Size(10.0, 10.0),
      builder: (context, index, data) {
        return ClipRRect(
          borderRadius: new BorderRadius.circular(16.0),
          child: Image.network(
            this.images.list[index].url,
            fit: BoxFit.fill,
          ),
        );
      },
      count: this.images.list.length,
    );
  }
}
