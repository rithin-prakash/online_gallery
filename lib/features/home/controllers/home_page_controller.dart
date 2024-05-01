import 'package:get/get.dart';
import 'package:online_gallery/models/photo_model.dart';
import 'package:online_gallery/services/api_service.dart';

class HomePageController extends GetxController {
  late final List<PhotoModel> model;
  RxBool isLoading = false.obs;

  void loadImages(String query) async {
    isLoading(true);

    final res = await ApiService.instance.getImages(query);

    res.fold(
      (l) {
        model = [];
        Get.snackbar('Failed', l.message);
      },
      (r) => model = r,
    );

    isLoading(false);
  }
}
