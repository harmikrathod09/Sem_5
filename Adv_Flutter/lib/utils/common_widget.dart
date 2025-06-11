import 'import_export.dart';

class CommonWidget {
  Widget textField(controller, hintTxt, labelTxt) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintTxt,
        labelText: labelTxt,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget titleText(title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget titleRowText(label, value) {
    return Row(
      children: [
        Text(
          "$label : ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(value, style: TextStyle(fontSize: 18, color: Colors.black)),
      ],
    );
  }
}
