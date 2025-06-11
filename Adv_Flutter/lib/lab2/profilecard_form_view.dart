
import 'package:adv_flutter/utils/import_export.dart';



class ProfilecardFormView extends StatefulWidget {
  const ProfilecardFormView({super.key});

  @override
  State<ProfilecardFormView> createState() => _ProfilecardFormViewState();
}

class _ProfilecardFormViewState extends State<ProfilecardFormView> {
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _rollController = TextEditingController();
  TextEditingController _experianceController = TextEditingController();
  TextEditingController _instaIdController = TextEditingController();
  TextEditingController _linkedinIdController = TextEditingController();
  TextEditingController _gitidController = TextEditingController();
  TextEditingController _whatsappnoController = TextEditingController();

  CommonWidget _widget = CommonWidget();
  ProfilecardFormController _profilecardFormController =
      ProfilecardFormController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILE_CARD_FORM_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _widget.titleText(PERSONAL_INFORMATION),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _widget.textField(
                              _fnameController,
                              PC_ENTER_FNAME,
                              PC_LABLE_FNAME,
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: _widget.textField(
                              _lnameController,
                              PC_ENTER_LNAME,
                              PC_LABLE_LNAME,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      _widget.textField(
                        _emailController,
                        PC_ENTER_EMAIL,
                        PC_ENTER_EMAIL,
                      ),
                      SizedBox(height: 10),
                      _widget.textField(
                        _mobileController,
                        PC_ENTERMO_NO,
                        PC_LABEL_MO_NO,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _widget.titleText(PROFESSIONAL_INFORMATION),
                      SizedBox(height: 10),
                      _widget.textField(
                        _rollController,
                        PC_ENTER_ROLL,
                        PC_LABEL_ROLL,
                      ),
                      SizedBox(height: 10),
                      _widget.textField(
                        _experianceController,
                        PC_ENTER_EXPERIENCE,
                        PC_LABEL_EXPERIENCE,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _widget.titleText(SOCIAL_MEDIA),
                      SizedBox(height: 10),
                      _widget.textField(
                        _whatsappnoController,
                        PC_ENTER_WHATSAPP_NO,
                        PC_LABEL_WHATSAPP_NO,
                      ),
                      SizedBox(height: 10),
                      _widget.textField(
                        _instaIdController,
                        PC_ENTER_INSTA_ID,
                        PC_LABEL_INSTA_ID,
                      ),
                      SizedBox(height: 10),
                      _widget.textField(
                        _linkedinIdController,
                        PC_ENTER_LINKEDIN_ID,
                        PC_LABEL_LINKEDIN_ID,
                      ),
                      SizedBox(height: 10),
                      _widget.textField(
                        _gitidController,
                        PC_ENTER_GIT_ID,
                        PC_LABEL_GIT_ID,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  _profilecardFormController.mapCreate(
                    fname: _fnameController.text,
                    lname: _lnameController.text,
                    email: _emailController.text,
                    mo_no: _mobileController.text,
                    roll: _rollController.text,
                    experiance: _experianceController.text,
                    whatsapp: _whatsappnoController.text,
                    insta: _instaIdController.text,
                    linkedin: _linkedinIdController.text,
                    git: _gitidController.text,
                  );
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfiecardView()));
                },
                child: Text(BTN_SUBMIT),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
