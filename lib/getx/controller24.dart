import 'package:get/get.dart';
import 'package:rss/utils/rss.dart';

class Get24Controller extends GetxController {
  var news = [].obs;
  var isLoad = false.obs;
  var error = false.obs;

  final Api _newsProvider = LentaLastNews24Provider();

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  Future<void> loadNews() async {
    try {
      news.value = await _newsProvider.getNews();

      isLoad.value = true;
    } on RssNewsException {
      error.value = true;
    }
  }

  Future<void> reloadNews() async {
    isLoad.value = false;
    onInit();
  }
}
