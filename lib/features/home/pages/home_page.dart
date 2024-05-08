import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:online_gallery/features/home/controllers/home_page_controller.dart';
import 'package:online_gallery/features/home/widgets/images_grid.dart';
import 'package:online_gallery/features/home/widgets/search_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _c = Get.put(HomePageController());
  final textEdit = TextEditingController();
  final scrollController = PageController();

  @override
  void initState() {
    super.initState();

    _loadImages(true);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadImages(false);
      }
    });
  }

  _loadImages(bool newSearch) {
    _c.loadImages(textEdit.text.trim(), newSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchText(
                controller: textEdit,
                onSearch: () {
                  _loadImages(true);
                }),
            Expanded(
              child: Obx(
                () {
                  return _c.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _c.model.isEmpty
                          ? const Center(
                              child: Text('No images found'),
                            )
                          : Column(
                              children: [
                                ImagesGrid(scrollController),
                                if (_c.isLoadingMore.value)
                                  const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: CircularProgressIndicator(),
                                  ),
                              ],
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
