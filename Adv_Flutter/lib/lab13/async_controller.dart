import 'package:get/get.dart';

class AsyncController extends GetxController {
  var result = "Press a button to fetch data".obs;

  Future<void> fetchData(bool throwError) async {
    result.value = "Fetching....";
    await Future.delayed(Duration(seconds: 2));

    try {
      if (throwError) {
        throw Exception("Error: somthing went wrong while fetching data");
      }
      result.value = "Success: Data fetched successfully";
    } catch (e) {
      result.value = "Caught an error: $e";
    } finally {
      result.value += "Fetch attempt complete";
    }
  }
}
