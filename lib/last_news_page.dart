import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rss/getx/controller.dart';
import '../../utils/utils.dart';
import '../../widgets/image_news_widget.dart';
import 'utils/rss.dart';

class LastNewsPage extends StatelessWidget {
  LastNewsPage({Key? key, required Api newsProvider})
      : _newsProvider = newsProvider,
        super(key: key);
  final Api _newsProvider;
  GetController controller2 = Get.put(GetController());

  @override
  Widget build(BuildContext context) {
    return GetX<GetController>(builder: (controller2) => page2(context));
  }

  Widget page2(BuildContext context) {
    if (controller2.isLoad.value == false) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller2.isLoad.value == true) {
      return RefreshIndicator(
        child: listBuilder(context, controller2),
        onRefresh: () => controller2.reloadNews(),
      );
    } else {
      return Container();
    }
  }

  Widget listBuilder(BuildContext context, controller2) {
    return ListView.builder(
        itemCount: controller2.news2.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller2.news2[index];
          return ListTile(
            title: Text(
              item.title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              maxLines: 8,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300]!,
              size: 30,
            ),
            contentPadding: const EdgeInsets.all(15),
            onTap: () => launchUniversalLink(item.link!),
            leading: ImageNewsWidget(
              urlImage: item.enclosure!.url!,
            ),
          );
        });
  }
}
