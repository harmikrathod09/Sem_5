import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'different_widget_controller.dart';

class DifferentWidgetView extends StatelessWidget {
  DifferentWidgetView({Key? key}) : super(key: key);

  final DifferentWidgetController controller = Get.put(DifferentWidgetController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Responsive Widgets with GetX")),
      body: width < 600 ? ListViewWidget() : GridViewWidget(),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  ListViewWidget({Key? key}) : super(key: key);

  final DifferentWidgetController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        final item = controller.items[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(item.title),
            subtitle: Text(item.subtitle),
          ),
        );
      },
    ));
  }
}

class GridViewWidget extends StatelessWidget {
  GridViewWidget({Key? key}) : super(key: key);

  final DifferentWidgetController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3,
      ),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        final item = controller.items[index];
        return Card(
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
          ),
        );
      },
    ));
  }
}
