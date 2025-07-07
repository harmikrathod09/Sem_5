import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class StudentController extends GetxController {
  final students = <StudentModel>[].obs;
  final repo = StudentRepo();

  var filteredStudents = <StudentModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() async {
    students.value = await repo.getAllStudents();
    _applyFilter();
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

  void search(String query) {
    searchQuery.value = query;
    _applyFilter();
  }

  void _applyFilter() {
    if (searchQuery.value.isEmpty) {
      filteredStudents.value = students;
    } else {
      filteredStudents.value = students.where((s) {
        final q = searchQuery.value.toLowerCase();
        return (s.fname?.toLowerCase().contains(q) ?? false) ||
            (s.lname?.toLowerCase().contains(q) ?? false) ||
            (s.enNo?.toLowerCase().contains(q) ?? false);
      }).toList();
    }
  }
}
