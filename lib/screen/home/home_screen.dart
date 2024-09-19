import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_slider/screen/home/photoscreen.dart';
import 'home_controller.dart';

/*
class HomeScreen extends StatelessWidget {
  final PhotoController photoController = Get.put(PhotoController());
  final TextEditingController searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: "Search photos...",
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            photoController.fetchPhotos(query: value);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              photoController.fetchPhotos(query: searchController.text);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (photoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: photoController.photosList.length,
          itemBuilder: (context, index) {
            var photo = photoController.photosList[index];
            return GestureDetector(
              onTap: () {
                Get.to(PhotoDetailsScreen(photo: photo));
              },
              child: CachedNetworkImage(
                imageUrl: photo['urls']['small'],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
          },
        );
      }),
    );
  }
}*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhotoController>(
        init: PhotoController(),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: TextField(
                  controller: _.searchController,
                  decoration: const InputDecoration(
                    hintText: "Search photos...",
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    _.fetchPhotos(query: value);
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      _.fetchPhotos(query: _.searchController.text);
                    },
                  ),
                ],
              ),
              body: Obx(() {
                if (_.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _.photosList.length,
                  itemBuilder: (context, index) {
                    var photo = _.photosList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(PhotoDetailsScreen(photo: photo));
                      },
                      child: CachedNetworkImage(
                        imageUrl: photo['urls']['small'],
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                );
              }));
        });
  }
}
