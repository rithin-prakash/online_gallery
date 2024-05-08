import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:online_gallery/features/home/widgets/fullscreen_image.dart';
import 'package:online_gallery/features/home/controllers/home_page_controller.dart';

class ImagesGrid extends StatelessWidget {
  ImagesGrid(this.scrollController, {super.key});

  final PageController scrollController;
  final _c = Get.find<HomePageController>();

  int _getItemCountPerRow(BuildContext context) {
    double minTileWidth = 100; //in your case
    double availableWidth = MediaQuery.of(context).size.width;

    int i = availableWidth ~/ minTileWidth;
    return i;
  }

  _showFullScreen(String url, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          clipBehavior: Clip.none,
          insetPadding: EdgeInsets.zero,
          child: FullscreenImage(
            url: url,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(2),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getItemCountPerRow(context),
        ),
        itemCount: _c.model.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                _showFullScreen(_c.model[i].largeImageUrl, context);
              },
              child: Image.network(
                _c.model[i].largeImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
