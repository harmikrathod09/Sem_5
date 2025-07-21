
import 'package:adv_flutter/lab12_to_do/api/todo_repository.dart';
import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class TodoController extends GetxController {
  final TodoRepository _repository = TodoRepository();

  var todos = <TodoModel>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos(); // load todos when controller initializes
  }

  Future<void> fetchTodos() async {
    isLoading.value = true;
    try {
      todos.value = await _repository.getTodos();
      error.value = '';
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    isLoading.value = true;
    try {
      final newTodo = await _repository.addTodo(todo);
      if (newTodo != null) {
        todos.add(newTodo);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    isLoading.value = true;
    try {
      final updated = await _repository.updateTodo(todo);
      if (updated != null) {
        final index = todos.indexWhere((t) => t.id == updated.id);
        if (index != -1) {
          todos[index] = updated;
        }
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteTodo(String id) async {
    isLoading.value = true;
    try {
      final success = await _repository.deleteTodo(id);
      if (success) {
        todos.removeWhere((t) => t.id == id);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
