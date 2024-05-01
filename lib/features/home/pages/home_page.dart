import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:online_gallery/features/home/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _c = Get.put(HomePageController());

  @override
  void initState() {
    super.initState();

    _c.loadImages('');
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
      body: Obx(() {
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
    );
  }
}
