import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class StudentController{
  RxList<StduentModel> studentList=<StduentModel>[].obs;
  late Database db;
  GlobalKey<FormState> formKey=GlobalKey();

  var fnameController=TextEditingController();
  var lnameController=TextEditingController();
  var enoController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var branchConroller=TextEditingController();
  var cgpaController=TextEditingController();
  var diplcgpaController=TextEditingController();
}