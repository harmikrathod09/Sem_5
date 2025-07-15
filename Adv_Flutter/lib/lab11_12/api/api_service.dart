import 'dart:convert';
import 'package:adv_flutter/utils/import_export.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = "https://67c94c000acf98d070899d14.mockapi.io/User";

  // GET all users
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  // POST new user
  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add user");
    }
  }

  // PUT update user
  Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${user.id}'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update user");
    }
  }

  // DELETE user
  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete user");
    }
  }
}
