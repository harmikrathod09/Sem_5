
import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';


class CheckboxMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final controller = Get.find<CheckboxController>();
    return controller.isChecked.value
        ? null
        : const RouteSettings(name: FIRST_MIDDLEWARE_PAGE);
  }
}
