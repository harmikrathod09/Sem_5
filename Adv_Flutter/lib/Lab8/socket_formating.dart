import 'dart:io';

void main() {
  try {
    stdout.write("Enter a number: ");
    String input = stdin.readLineSync()!;
    int number = int.parse(input);
    print("You entered: $number");

    simulateSocketOperation();

  } on FormatException catch (e) {
    print("Error: Invalid number format. (${e.message})");

  } on SocketException catch (e) {
    print("Error: Network issue or socket failure. (${e.message})");

  } catch (e) {
    print("An unexpected error occurred: $e");

  } finally {
    print("Program execution completed.");
  }
}

void simulateSocketOperation() {
  throw const SocketException("Failed to connect to the server.");
}
