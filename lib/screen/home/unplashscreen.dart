import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class UnsplashGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unsplash Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
