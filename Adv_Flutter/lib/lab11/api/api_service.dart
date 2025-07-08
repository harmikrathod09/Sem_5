import 'dart:convert';
import 'package:adv_flutter/utils/import_export.dart';
import 'package:http/http.dart' as http;

class ApiService{
  String baseUrl="https://67c94c000acf98d070899d14.mockapi.io/User";


  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  void addUser(){

  }

  void deleteUser() {

  }

  void editUser(){

  }

  // Replace URL with your actual working API



}