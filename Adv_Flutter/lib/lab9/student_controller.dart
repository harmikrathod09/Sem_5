import 'package:get/get.dart';
import 'package:adv_flutter/lab9/student_model.dart';
import 'package:adv_flutter/lab9/student_repo.dart';

class StudentController extends GetxController {
  final students = <StudentModel>[].obs;
  final repo = StudentRepo();

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents() async {
    students.value = await repo.getAllStudents();
  }

  void addStudent(StudentModel student) async {
    await repo.insertStudent(student);
    fetchStudents();
  }

  void updateStudent(StudentModel student) async {
    await repo.updateStudent(student);
    fetchStudents();
  }

  void deleteStudent(int id) async {
    await repo.deleteStudent(id);
    fetchStudents();
  }
}