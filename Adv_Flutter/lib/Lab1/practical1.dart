class Student {
  int? rollNo;
  String? name;
  String? enrollmentNO;

  void displayStudentDetails({
    int? rollNo,
    String? name,
    String? enrollmentNo,
  }) {
    print("Roll No: $rollNo\nName: $name\nEnrollment No: $enrollmentNo");
  }
}

void main() {
  Student student = Student();
  student.displayStudentDetails(
    rollNo: 389,
    name: "Harmik",
    enrollmentNo: "24010101680",
  );
}
