import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileReadExample extends StatefulWidget {
  @override
  _FileReadExampleState createState() => _FileReadExampleState();
}

class _FileReadExampleState extends State<FileReadExample> {
  String fileContent = "Press the button to read file.";

  Future<void> readFile() async {
    if (!await _checkAndRequestPermissions()) return;

    try {
      final dir = await getExternalStorageDirectory();
      if (dir == null) {
        setState(() {
          fileContent = "Could not get external storage directory.";
        });
        return;
      }

      final file = File('${dir.path}/sample.txt');

      if (await file.exists()) {
        final content = await file.readAsString();
        setState(() {
          fileContent = "File Content:\n\n$content";
        });
      } else {
        setState(() {
          fileContent = "File not found: ${file.path}";
        });
      }
    } catch (e) {
      setState(() {
        fileContent = "Error reading file: $e";
      });
    }
  }

  Future<void> writeFile(String dataToWrite) async {
    if (!await _checkAndRequestPermissions()) return;

    try {
      final dir = await getExternalStorageDirectory();
      if (dir == null) {
        setState(() {
          fileContent = "Could not get external storage directory.";
        });
        return;
      }

      final file = File('${dir.path}/sample.txt');

      await file.writeAsString(dataToWrite);

      setState(() {
        fileContent = "Data written to file:\n\n$dataToWrite";
      });
    } catch (e) {
      setState(() {
        fileContent = "Error writing file: $e";
      });
    }
  }

  Future<bool> _checkAndRequestPermissions() async {
    var status = await Permission.storage.status;

    if (status.isDenied || status.isRestricted) {
      status = await Permission.storage.request();
    }

    if (Platform.isAndroid && await _isAndroid11OrAbove()) {
      if (!await Permission.manageExternalStorage.isGranted) {
        final result = await Permission.manageExternalStorage.request();
        if (!result.isGranted) {
          setState(() {
            fileContent = "Manage External Storage permission not granted!";
          });
          return false;
        }
      }
    } else {
      if (!status.isGranted) {
        setState(() {
          fileContent = "Storage permission not granted!";
        });
        return false;
      }
    }

    return true;
  }

  Future<bool> _isAndroid11OrAbove() async {
    try {
      return Platform.isAndroid && (await File('/system/build.prop').readAsString()).contains("ro.build.version.sdk=30");
    } catch (_) {
      // fallback or unable to read file, just assume false
      return false;
    }
  }

  // Show dialog to input data to write
  Future<void> _showWriteDialog() async {
    TextEditingController controller = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Write data to file'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: "Enter text here"),
          maxLines: null,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null), // Cancel
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) {
                // You can add validation or disable button if empty
                return;
              }
              Navigator.pop(context, controller.text.trim());
            },
            child: Text('Write'),
          ),
        ],
      ),
    );

    if (result != null) {
      await writeFile(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read & Write File on External Storage")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _showWriteDialog,
              child: Text("Write File"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: readFile,
              child: Text("Read File"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(fileContent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
