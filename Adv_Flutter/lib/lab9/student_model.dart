import 'package:adv_flutter/utils/import_export.dart';

class StduentModel {
  int? _studentId;

  int get studentId => _studentId!;

  set studentId(int value) {
    _studentId = value;
  }

  String? _fname;

  String get fname => _fname!;

  set fname(String value) {
    _fname = value;
  }

  String? _lname;

  String get lname => _lname!;

  set lname(String value) {
    _lname = value;
  }

  String? _enNo;

  String get enNo => _enNo!;

  set enNo(String value) {
    _enNo = value;
  }

  String? _email;

  String get email => _email!;

  set email(String value) {
    _email = value;
  }

  String? _phone;

  String get phone => _phone!;

  set phone(String value) {
    _phone = value;
  }

  String? _branch;

  String get branch => _branch!;

  set branch(String value) {
    _branch = value;
  }

  double? _cgpa;

  double get cgpa => _cgpa!;

  set cgpa(double value) {
    _cgpa = value;
  }

  double? _diplCgpa;

  double get diplCgpa => _diplCgpa!;

  set diplCgpa(double value) {
    _diplCgpa = value;
  }

  StduentModel({
    int? studentId,
    String? fname,
    String? lname,
    String? enNo,
    String? email,
    String? phone,
    String? branch,
    double? cgpa,
    double? diplCgpa,
  }) : _studentId = studentId,
       _fname = fname,
       _lname = lname,
       _enNo = enNo,
       _email = email,
       _phone = phone,
       _branch = branch,
       _cgpa = cgpa,
       _diplCgpa = diplCgpa;

  Map<String, Object?> toMap() {
    return {
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
  }

  StduentModel fromMap(Map<String, Object?> studentData) {
    return StduentModel(
      studentId: studentData[COL_STUDENT_ID] as int,
      fname: studentData[COL_STUDENT_FNAME].toString(),
      lname: studentData[COL_STUDENT_LNAME].toString(),
      enNo: studentData[COL_STUDENT_ENO].toString(),
      email: studentData[COL_STUDENT_EMAIL].toString(),
      phone: studentData[COL_STUDENT_PHONE].toString(),
      branch: studentData[COL_STUDENT_BRANCH].toString(),
      cgpa: studentData[COL_STUDENT_CGPA] as double,
      diplCgpa: studentData[COL_STUDENT_DIPL_CGPA] as double,
    );
  }
}
