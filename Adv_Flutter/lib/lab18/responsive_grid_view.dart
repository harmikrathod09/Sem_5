import 'package:get/get.dart';
import '../utils/import_export.dart';


class ResponsiveGridView extends StatelessWidget {
  ResponsiveGridView({super.key});

  final ResponsiveGridController controller = Get.put(ResponsiveGridController());

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive columns
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth < 600) {
      crossAxisCount = 2;
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 6;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(() => GridView.builder(
          itemCount: controller.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            ResponsiveGridModel item = controller.items[index];
            return Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(item.image, height: 80, width: 80),
                  const SizedBox(height: 10),
                  Text(item.title),
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
