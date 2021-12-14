import 'package:get/get.dart';
import 'package:rss/utils/rss.dart';

class GetController extends GetxController {
  var news2 = [].obs;
  var isLoad = false.obs;
  var error = false.obs;

  final Api _newsProvider = LentaLastNewsProvider();

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  Future<void> loadNews() async {
    try {
      news2.value = await _newsProvider.getNews();

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
