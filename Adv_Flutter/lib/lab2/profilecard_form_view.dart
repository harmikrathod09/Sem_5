import 'package:madf/utils/common_widget.dart';
import 'package:madf/utils/import_export.dart';

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
  TextEditingController _instaURLController = TextEditingController();
  TextEditingController _linkedinURLController = TextEditingController();
  TextEditingController _gitURLController = TextEditingController();

  CommonWidget _widget = CommonWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILECARDAPPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _widget.textField(
                    _fnameController,
                    PCENTERFNAME,
                    PCLABLEFNAME,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: _widget.textField(
                    _lnameController,
                    PCENTERLNAME,
                    PCLABLELNAME,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _widget.textField(_emailController, PCENTEREMAIL, PCENTEREMAIL),
            SizedBox(height: 10),
            _widget.textField(_mobileController, PCENTERMONO, PCLABELMONO),
            SizedBox(height: 10),
            _widget.textField(_emailController, PCENTEREMAIL, PCLABELEMAIL),
            SizedBox(height: 10),
            _widget.textField(_rollController, PCENTERROLL, PCLABELROLL),
            SizedBox(height: 10),
            _widget.textField(
              _experianceController,
              PCENTEREXPERIENCE,
              PCLABELEXPERIENCE,
            ),
            SizedBox(height: 10),
            _widget.textField(
              _instaURLController,
              PCENTERINSTAURL,
              PCLABELINSTAURL,
            ),
            SizedBox(height: 10),
            _widget.textField(
              _linkedinURLController,
              PCENTERLINKEDINURL,
              PCLABELLINKEDINURL,
            ),
            SizedBox(height: 10),
            _widget.textField(
              _gitURLController,
              PCENTERGITURL,
              PCLABELGITURL,
            ),
            SizedBox(height: 15),
            OutlinedButton(onPressed: () {

            }, child: Text(BTNSUBMIT)),
          ],
        ),
      ),
    );
  }
}
