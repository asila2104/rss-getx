import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss/getx/controller24.dart';
import 'utils/rss.dart';
import 'widgets/list_item_widget.dart';

class Last24NewsPage extends StatelessWidget {
  late Get24Controller controller;
  Last24NewsPage({Key? key, required Api newsProvider})
      : _newsProvider = newsProvider,
        super(key: key) {
    controller = Get.put(Get24Controller());
  }
  final Api _newsProvider;

  @override
  Widget build(BuildContext context) {
    return GetX<Get24Controller>(builder: (controller) => page(context));
  }

  Widget page(BuildContext context) {
    if (controller.isLoad.value == false) {
      return const Center(child: CircularProgressIndicator());
    }

    if (controller.isLoad.value == true) {
      return RefreshIndicator(
        child: listBuilder(context, controller),
        onRefresh: () => controller.reloadNews(),
      );
    } else {
      return Container();
    }
  }

  Widget listBuilder(BuildContext context, providerWatch) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.news[index];
          return ListItemWidget(item: item);
        });
  }
}
