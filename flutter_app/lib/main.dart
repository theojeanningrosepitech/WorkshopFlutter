import 'package:flutter/material.dart';
import 'package:flutter_app/ListPictures.dart';
import 'package:flutter_app/ListPicturesVertical.dart';
import 'package:flutter_app/services/ImageService.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'model/Image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ImageModelList images;
  _MyHomePageState() {
    ImagesService().getImage().then((ImageModelList a) => (setState(() => this.images = a)));
  }
  @override
  Widget build(BuildContext context) {
    if (this.images != null && this.images.list != null) {
      return DefaultTabController(
          child: Scaffold(
            appBar: Bar(),
            body: Body(),
          ),
          length: 2
      );
    } else {
      return LoadingWiget();
    }

  }

  Widget Bar() {
    return  AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
              )
          ),
        ),

        title: Text("WorkShop Flutter"),
        bottom: TabBar(tabs: <Widget>[
          Tab(
            text: "Horizontal",
          ),
          Tab(text: "Vertical")
        ]));
  }
  Widget Body() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ListPictures(images: this.images),
        ListPicturesVertical(images: this.images),
      ],
    );
  }

  Widget LoadingWiget() {
    return Center(
        child: Loading(
            indicator: BallPulseIndicator(), size: 100.0, color: Colors.redAccent)
    );
  }


}

