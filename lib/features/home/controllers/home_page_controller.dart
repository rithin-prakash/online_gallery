import 'package:get/get.dart';

import 'package:online_gallery/models/photo_model.dart';
import 'package:online_gallery/services/api_service.dart';

class HomePageController extends GetxController {
  List<PhotoModel> model = [];
  RxBool isLoading = false.obs;
  RxBool isLoadingMore = false.obs;

  int currentPage = 1;

  void loadImages(String query, bool newSearch) async {
    if (newSearch) {
      currentPage = 1;
      isLoading(true);
    } else {
      currentPage = currentPage + 1;
      isLoadingMore(true);
    }

    final res = await ApiService.instance.getImages(query, currentPage);

    res.fold(
      (l) {
        isLoading(false);
        model = [];
        Get.snackbar('Failed', l.message);
      },
      (r) {
        isLoading(false);

        if (currentPage == 1) {
          model.clear();
          model = r;
        } else {
          isLoadingMore(false);

          model.addAll(r);
        }
      },
    );
  }
}
