import 'package:adv_flutter/utils/import_export.dart';

class StudentRepo {
    Future<int> insertStudent(StudentModel student) async {
        final db = await MyDatabase.instance.database;
        return await db.insert(TBL_STUDENT, student.toMap());
    }

    Future<List<StudentModel>> getAllStudents() async {
        final db = await MyDatabase.instance.database;
        final result = await db.query(TBL_STUDENT);
        return result.map((e) => StudentModel.fromMap(e)).toList();
    }

    Future<int> updateStudent(StudentModel student) async {
        final db = await MyDatabase.instance.database;
        return await db.update(
            TBL_STUDENT,
            student.toMap(),
            where: '$COL_STUDENT_ID = ?',
            whereArgs: [student.studentId],
        );
    }

    Future<int> deleteStudent(int id) async {
        final db = await MyDatabase.instance.database;
        return await db.delete(
            TBL_STUDENT,
            where: '$COL_STUDENT_ID = ?',
            whereArgs: [id],
        );
    }
}
