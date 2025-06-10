import 'import_export.dart';

class CommonWidget{
  Widget textField(controller,hintTxt,labelTxt){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(

        hintText: hintTxt,
        labelText: labelTxt,
        border: OutlineInputBorder(),
      ),
    );
  }
}