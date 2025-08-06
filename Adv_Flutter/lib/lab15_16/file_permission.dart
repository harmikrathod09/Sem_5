import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class FilePermission extends StatelessWidget {
  const FilePermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          APPBAR_FILE_PERMISSION,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Center(child: Text(FILE_PERMISSION_CENTER_TXT)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          PermissionStatus permission = await Permission.manageExternalStorage.request();
          if (permission.isDenied || permission.isPermanentlyDenied) {
            Get.snackbar(
              TITLE_PERMISSION,
              SUBTITLE_PERMISSION_DENIDED,
              colorText: Colors.white,
              backgroundColor: Colors.red,
            );
          } else {
            Get.snackbar(
              TITLE_PERMISSION,
              SUBTITLE_PERMISSION_GRANTED,
              colorText: Colors.white,
              backgroundColor: Colors.green,
            );
          }
        },
        child: Icon(Icons.file_copy),
      ),
    );
  }
}
