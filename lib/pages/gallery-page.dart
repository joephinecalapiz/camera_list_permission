import 'package:camera_list_permission/pages/profile-page.dart';
import 'package:flutter/material.dart';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> gallery = <dynamic>[];
  Future? _imagesGetPath;

  @override
  void initState() {
    _getPermission();
    super.initState();
    _imagesGetPath = getImage();
  }

  void _getPermission() async {
    await Permission.storage.request().isGranted;
    setState(() {});
  }

  Future<String> getImage() {
    return ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DCIM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: FutureBuilder(
              future: _imagesGetPath,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var img = Directory(snapshot.data);
                  if (true) _getImages(img);
                  return Text(snapshot.data);
                } else {
                  return const Text(" loading images ...");
                }
              },
            ),
          ),
          Expanded(
            flex: 30,
            child: GridView.count(
              crossAxisCount: 3,
              children: _getListImg(gallery),
            ),
          )
        ],
      ),
    );
  }

  void goToProfile() {
    final route = MaterialPageRoute(builder: (context) => const Profile());
    Navigator.push(context, route);
  }

  _getImages(Directory dir) {
    List<dynamic> listPhoto = [];
    dir.list().forEach((ph) {
      RegExp photoExp = RegExp(
          "(gif|jpe?g|tiff?|png|webp|bmp)", caseSensitive: false);
      if (photoExp.hasMatch('$ph')) listPhoto.add(ph);
      setState(() {
        gallery = listPhoto;
      });
    });
  }

  List<Widget> _getListImg(List<dynamic> listImagePath) {
    List<Widget> gallery = [];
    for (var imagePath in listImagePath) {
      gallery.add(
        Container(
          padding: const EdgeInsets.all(5),
          child: Image.file(imagePath, fit: BoxFit.cover),
        ),
      );
    }
    return gallery;
  }
}