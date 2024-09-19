import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PhotoController extends GetxController {
  var isLoading = true.obs;
  var photosList = [].obs;
  TextEditingController searchController = TextEditingController();
  Future<void> fetchPhotos({String query = ''}) async {
    try {
      isLoading(true);  // Start the loader

      // Construct the URL based on whether a search query is present or not
      String baseUrl = 'https://api.unsplash.com/';
      String url;

      if (query.isEmpty) {
        url = '${baseUrl}photos?client_id=pUOj8pv3nXjBOTsIwKRlvjF1OdlystRgFwpfbjKL4-A';
      } else {
        url = '${baseUrl}search/photos?query=$query&client_id=pUOj8pv3nXjBOTsIwKRlvjF1OdlystRgFwpfbjKL4-A';
      }

      // Fetch the data
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Parse data based on whether it's a search or regular fetch
        if (query.isEmpty) {
          // If no search query, directly assign the list
          photosList.value = List.from(data);
        } else {
          // If searching, get results from 'results' field
          photosList.value = List.from(data['results']);
        }

        print("dataList length: ${photosList.length}");
      } else {
        Get.snackbar("Error", "Failed to load photos");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading(false);  // Stop the loader
    }
  }
/*  Future<void> fetchPhotos() async {
    try {
      isLoading(true); // Start the loader
      String url =
          'https://api.unsplash.com/photos?client_id=pUOj8pv3nXjBOTsIwKRlvjF1OdlystRgFwpfbjKL4-A';

      // Send GET request
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Update the list of photos
        photosList.value = List.from(data);
      } else {
        Get.snackbar("Error", "Failed to load photos");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    } finally {
      isLoading(false); // Stop the loader
    }
  }*/
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPhotos();
  }
}
