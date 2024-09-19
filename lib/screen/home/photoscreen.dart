import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/appcolor.dart';
import '../../widget/text_view.dart';

class PhotoDetailsScreen extends StatelessWidget  {
  final Map photo;

  PhotoDetailsScreen({required this.photo});

  Future<void> downloadImage(String url) async {
    if (await _requestPermission()) {
      try {
        var dio = Dio();
        var response = await dio.get(url,
            options: Options(responseType: ResponseType.bytes));

        // Save the image to the gallery
        final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "downloaded_image",
        );
        print('Image saved to gallery');
        showSnackBar("Image saved to gallery");
      } catch (e) {
        print("Error downloading or saving the image: $e");
        showSnackBar('Error downloading or saving the image: $e');
      }
    }
  }

  // Request storage or media access permissions based on the Android version
  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      var androidInfo = await Permission.storage.status;
      if (androidInfo.isGranted) {
        return true;
      } else {
        if (await Permission.storage.request().isGranted ||
            (await Permission.photos.request().isGranted)) {
          return true;
        } else {
          print("Permissions not granted for storage!");
          return false;
        }
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo['user']['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(photo['urls']['regular']),
            SizedBox(height: 10),
            Text(
              "Photographer: ${photo['user']['name']}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Likes: ${photo['likes']}"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => downloadImage(photo['urls']['full']),
              child: Text("Download"),
            ),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(String? message, {int duration = 3}) {
  print("$message");
  Get.snackbar(
    backgroundColor: AppColors.white,
    message.toString(),
    "",
    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    snackPosition:
        Platform.isAndroid ? SnackPosition.BOTTOM : SnackPosition.TOP,
    duration: Duration(seconds: duration),
    titleText: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.redDark),
          borderRadius: BorderRadius.circular(10)),
      child: TextView(
        message.toString(),
        fontWeight: FontWeight.w500,
        textColor: AppColors.redDark,
      ),
    ),
    messageText: const SizedBox.shrink(),
  );
}
