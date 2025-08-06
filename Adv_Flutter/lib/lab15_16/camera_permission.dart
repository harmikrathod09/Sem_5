import 'package:adv_flutter/utils/import_export.dart';

class CameraPermission extends StatelessWidget {
  const CameraPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          APPBAR_CAMERA_PERMISSION,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Center(child: Text(CAMERA_PERMISSION_CENTER_TXT)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Permission.camera.request();
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
