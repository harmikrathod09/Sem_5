import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class AddEditView extends StatefulWidget {
  final StudentModel? student;

  AddEditView({this.student});

  @override
  _AddEditViewState createState() => _AddEditViewState();
}

class _AddEditViewState extends State<AddEditView> {
  final controller = Get.find<StudentController>();

  late final TextEditingController fnameController;
  late final TextEditingController lnameController;
  late final TextEditingController enNoController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController branchController;
  late final TextEditingController cgpaController;
  late final TextEditingController diplCgpaController;

  CommonWidget _widget = CommonWidget();

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    fnameController = TextEditingController();
    lnameController = TextEditingController();
    enNoController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    branchController = TextEditingController();
    cgpaController = TextEditingController();
    diplCgpaController = TextEditingController();

    // Pre-populate if editing
    if (widget.student != null) {
      fnameController.text = widget.student!.fname ?? '';
      lnameController.text = widget.student!.lname ?? '';
      enNoController.text = widget.student!.enNo ?? '';
      emailController.text = widget.student!.email ?? '';
      phoneController.text = widget.student!.phone ?? '';
      branchController.text = widget.student!.branch ?? '';
      cgpaController.text = widget.student!.cgpa?.toString() ?? '';
      diplCgpaController.text = widget.student!.diplCgpa?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    fnameController.dispose();
    lnameController.dispose();
    enNoController.dispose();
    emailController.dispose();
    phoneController.dispose();
    branchController.dispose();
    cgpaController.dispose();
    diplCgpaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(
          APPBAR_ADD_EDIT_PAGE,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _widget.textField(
                fnameController, COL_STUDENT_FNAME, COL_STUDENT_FNAME),
            SizedBox(height: 12),
            _widget.textField(
                lnameController, COL_STUDENT_LNAME, COL_STUDENT_LNAME),
            SizedBox(height: 12),
            _widget.textField(enNoController, COL_STUDENT_ENO, COL_STUDENT_ENO),
            SizedBox(height: 12),
            _widget.textField(
              emailController, COL_STUDENT_EMAIL, COL_STUDENT_EMAIL,
            ),
            SizedBox(height: 12),
            _widget.textField(
              phoneController, COL_STUDENT_PHONE, COL_STUDENT_PHONE,
            ),
            SizedBox(height: 12),
            _widget.textField(
                branchController, COL_STUDENT_BRANCH, COL_STUDENT_BRANCH),
            SizedBox(height: 12),
            _widget.textField(
              cgpaController, COL_STUDENT_CGPA, COL_STUDENT_CGPA,
            ),
            SizedBox(height: 12),
            _widget.textField(
              diplCgpaController, COL_STUDENT_DIPL_CGPA, COL_STUDENT_DIPL_CGPA,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newStudent = StudentModel(
                  studentId: widget.student?.studentId,
                  fname: fnameController.text,
                  lname: lnameController.text,
                  enNo: enNoController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  branch: branchController.text,
                  cgpa: double.tryParse(cgpaController.text) ?? 0.0,
                  diplCgpa: double.tryParse(diplCgpaController.text) ?? 0.0,
                );

                if (widget.student == null) {
                  controller.addStudent(newStudent);
                } else {
                  controller.updateStudent(newStudent);
                }
                Get.back();
              },
              child: Text(widget.student == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}