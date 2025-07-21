import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adv_flutter/utils/import_export.dart';

class TodoRepository {
  final String baseUrl = "https://67c94c000acf98d070899d14.mockapi.io/Todo";

  Future<List<TodoModel>> getTodos() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => TodoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoModel?> addTodo(TodoModel todo) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return TodoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add todo');
    }
  }

  Future<TodoModel?> updateTodo(TodoModel todo) async {
    final url = "$baseUrl/${todo.id}";
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(todo.toJson()),
    );
    if (response.statusCode == 200) {
      return TodoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update todo');
    }
  }

  Future<bool> deleteTodo(String id) async {
    final url = "$baseUrl/$id";
    final response = await http.delete(Uri.parse(url));
    return response.statusCode == 200 || response.statusCode == 204;
  }
}