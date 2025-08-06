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
    // 1. Request storage permission
    if (!await Permission.storage.request().isGranted) {
      setState(() {
        fileContent = "Storage permission not granted!";
      });
      return;
    }

    try {
      // 2. Get external directory
      final dir = await getExternalStorageDirectory();
      if (dir == null) {
        setState(() {
          fileContent = "Could not get external storage directory.";
        });
        return;
      }

      // 3. Define file path
      final file = File('${dir.path}/sample.txt');

      // 4. Check if file exists
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read File from External Storage")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
