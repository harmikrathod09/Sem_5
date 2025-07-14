import 'dart:io';

void main() {
  try {
    stdout.write("Enter 1st number: ");
    int no1 = int.parse(stdin.readLineSync()!);

    stdout.write("Enter 2nd number: ");
    int no2 = int.parse(stdin.readLineSync()!);

    if (no2 == 0) {
      throw IntegerDivisionByZeroException();
    }

    double divsion = no1 / no2;

    stdout.write("Division Value: $divsion");
  }
  on IntegerDivisionByZeroException{
    stdout.write("Can't Divisable by zero");
  }
  catch (e) {
    stdout.write("Error $e");
  }
}