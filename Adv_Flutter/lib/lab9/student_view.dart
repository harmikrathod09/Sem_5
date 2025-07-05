import 'package:adv_flutter/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adv_flutter/lab9/student_controller.dart';

class StudentView extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(APPBAR_VIEW, style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.students.length,
        itemBuilder: (context, index) {
          final student = controller.students[index];
          return ListTile(
            title: Text("${student.fname} ${student.lname}"),
            subtitle: Text(student.enNo ?? ""),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Get.toNamed(ROUTE_EDIT_STUDENT, arguments: student),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteStudent(student.studentId!),
                ),
              ],
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(ROUTE_ADD_STUDENT),
        child: Icon(Icons.add),
      ),
    );
  }
}