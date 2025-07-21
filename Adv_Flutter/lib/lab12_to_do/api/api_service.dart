import 'package:http/http.dart' as http;

abstract class ApiService{
  Future<http.Response> getData({Map<String, dynamic> data});

  Future<http.Response> postData({Map<String, dynamic> data});

  Future<http.Response> putData({Map<String, dynamic> data});

  Future<http.Response> deleteData({Map<String, dynamic> data});
}