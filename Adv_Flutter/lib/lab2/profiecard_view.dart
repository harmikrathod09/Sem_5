import 'package:adv_flutter/utils/import_export.dart';

class ProfiecardView extends StatelessWidget {
  ProfiecardView({super.key});

  CommonWidget _widget = CommonWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PROFILE_CARD_APPBAR, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _widget.titleText(PERSONAL_INFORMATION),
                    SizedBox(height: 10),
                    _widget.titleRowText(
                      PC_LABLE_NAME,
                      "${ProfileCardFormModel.user[PC_LABLE_FNAME]}  ${ProfileCardFormModel.user[PC_LABLE_LNAME]}",
                    ),
                    SizedBox(height: 10),
                    _widget.titleRowText(
                      PC_LABEL_EMAIL,
                      ProfileCardFormModel.user[PC_LABEL_EMAIL],
                    ),
                    SizedBox(height: 10),
                    _widget.titleRowText(
                      PC_LABEL_MO_NO,
                      ProfileCardFormModel.user[PC_LABEL_MO_NO],
                    ),
                    SizedBox(height: 20),
                    _widget.titleText(PROFESSIONAL_INFORMATION),
                    SizedBox(height: 10),
                    _widget.titleRowText(
                      PC_LABEL_ROLL,
                      ProfileCardFormModel.user[PC_LABEL_ROLL],
                    ),
                    SizedBox(height: 10),
                    _widget.titleRowText(
                      PC_LABEL_EXPERIENCE,
                      ProfileCardFormModel.user[PC_LABEL_EXPERIENCE],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.whatsapp)),
                        IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.instagram)),
                        IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.linkedin)),
                        IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.github)),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
