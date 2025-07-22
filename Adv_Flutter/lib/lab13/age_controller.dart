import 'package:get/get.dart';

class InvalidAgeException implements Exception {
  String errorMessage() => "Invalid age! Must be 18 or older";
}

class AgeController extends GetxController {
  var result="Enter your age below".obs;

  void checkAge(String input){
    try{
      int age = int.parse(input);
      if(age<18 && age>80){
        throw InvalidAgeException();
      }
      result.value="Access granted. age is valid: $age";
    } on InvalidAgeException catch(e){
      result.value=e.errorMessage();
    } catch(e){
      result.value="Invalid input. Please enter a valid age.";
    }
  }
}