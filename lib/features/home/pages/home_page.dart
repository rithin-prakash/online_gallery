import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import 'package:online_gallery/features/home/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _c = Get.put(HomePageController());
  final textEdit = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loadImages();
  }

  _loadImages() {
    _c.loadImages(textEdit.text.trim());
  }

  int getItemCountPerRow() {
    double minTileWidth = 100; //in your case
    double availableWidth = MediaQuery.of(context).size.width;

    int i = availableWidth ~/ minTileWidth;
    return i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEdit,
                    decoration:
                        const InputDecoration(hintText: 'Search for images'),
                  ),
                ),
                Container(
                  decoration: const ShapeDecoration(
                    color: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      _loadImages();
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return _c.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(2),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getItemCountPerRow(),
                      ),
                      itemCount: _c.model.length,
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.network(
                            _c.model[i].previewUrl,
                            fit: BoxFit.cover,
                          ),
                        );
                      });
            }),
          ),
        ],
      ),
    );
  }
}
