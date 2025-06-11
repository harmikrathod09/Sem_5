import 'package:adv_flutter/utils/import_export.dart';

class ProfileCardFormModel {
  Map<String, dynamic> user={};
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
  }) {
    user = {
      PC_LABLE_FNAME: fname,
      PC_LABLE_LNAME: lname,
      PC_LABEL_EMAIL: email,
      PC_LABEL_MO_NO: mo_no,
      PC_LABEL_ROLL: roll,
      PC_LABEL_EXPERIENCE: experiance,
      PC_LABEL_WHATSAPP_NO: whatsapp,
      PC_LABEL_INSTA_ID: insta,
      PC_LABEL_LINKEDIN_ID: linkedin,
      PC_LABEL_GIT_ID: git,
    };
    print(user);
  }
}
