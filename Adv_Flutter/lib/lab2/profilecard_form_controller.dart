import 'package:adv_flutter/utils/import_export.dart';

class ProfilecardFormController {
  ProfileCardFormModel _profileCardFormModel = ProfileCardFormModel();

  void mapCreate({
    fname,
    lname,
    email,
    mo_no,
    roll,
    experiance,
    whatsapp,
    insta,
    linkedin,
    git,
  }) => _profileCardFormModel.mapCreate(
    fname: fname,
    lname: lname,
    email: email,
    mo_no: mo_no,
    roll: roll,
    experiance: experiance,
    whatsapp: whatsapp,
    insta: insta,
    linkedin: linkedin,
    git: git,
  );
}
