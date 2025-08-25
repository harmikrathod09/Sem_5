import 'package:get/get.dart';

import '../utils/import_export.dart';

class DifferentWidgetController extends GetxController{
  RxList<DifferentWidgetModel> items = <DifferentWidgetModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  void loadItems() {
    items.value = List.generate(
      20,
          (index) => DifferentWidgetModel(
        title: 'title $index',
        subtitle: 'Subtitle $index'
      ),
    );
  }
}