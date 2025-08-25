import 'package:get/get.dart';
import '../utils/import_export.dart';

class ResponsiveGridController extends GetxController {
  // Reactive list of items
  RxList<ResponsiveGridModel> items = <ResponsiveGridModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems(); // Load initial content
  }

  void loadItems() {
    items.value = List.generate(
      20,
          (index) => ResponsiveGridModel(
        title: 'Item $index',
        image: 'https://via.placeholder.com/150',
      ),
    );
  }
}
