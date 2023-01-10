import 'package:camera_list_permission/pages/profile-page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.pink
    ),
    home: const Profile(),
  )
  );
}