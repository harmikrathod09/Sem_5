import 'package:adv_flutter/utils/import_export.dart';

class StudentModel {
  int? studentId;
  String? fname;
  String? lname;
  String? enNo;
  String? email;
  String? phone;
  String? branch;
  double? cgpa;
  double? diplCgpa;

  StudentModel({
    this.studentId,
    this.fname,
    this.lname,
    this.enNo,
    this.email,
    this.phone,
    this.branch,
    this.cgpa,
    this.diplCgpa,
  });

  Map<String, Object?> toMap() => {
    COL_STUDENT_ID: studentId,
    COL_STUDENT_FNAME: fname,
    COL_STUDENT_LNAME: lname,
    COL_STUDENT_ENO: enNo,
    COL_STUDENT_EMAIL: email,
    COL_STUDENT_PHONE: phone,
    COL_STUDENT_BRANCH: branch,
    COL_STUDENT_CGPA: cgpa,
    COL_STUDENT_DIPL_CGPA: diplCgpa,
  };

  factory StudentModel.fromMap(Map<String, Object?> map) => StudentModel(
    studentId: map[COL_STUDENT_ID] as int,
    fname: map[COL_STUDENT_FNAME] as String,
    lname: map[COL_STUDENT_LNAME] as String,
    enNo: map[COL_STUDENT_ENO] as String,
    email: map[COL_STUDENT_EMAIL] as String,
    phone: map[COL_STUDENT_PHONE] as String,
    branch: map[COL_STUDENT_BRANCH] as String,
    cgpa: map[COL_STUDENT_CGPA] as double,
    diplCgpa: map[COL_STUDENT_DIPL_CGPA] as double,
  );
}