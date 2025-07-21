import 'package:adv_flutter/lab12_to_do/todo_controller.dart';
import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class TodoListScreen extends StatelessWidget {
  final TodoController controller = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void showAddOrEditDialog({TodoModel? todo}) {
    if (todo != null) {
      titleController.text = todo.title;
      descriptionController.text = todo.description;
    } else {
      titleController.clear();
      descriptionController.clear();
    }

    Get.defaultDialog(
      title: todo == null ? 'Add Todo' : 'Edit Todo',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      textConfirm: todo == null ? 'Add' : 'Update',
      textCancel: 'Cancel',
      onConfirm: () {
        final title = titleController.text.trim();
        final desc = descriptionController.text.trim();
        if (title.isEmpty || desc.isEmpty) {
          Get.snackbar('Error', 'Title and description cannot be empty');
          return;
        }

        if (todo == null) {
          controller.addTodo(
            TodoModel(title: title, description: desc, status: false),
          );
        } else {
          controller.updateTodo(
            TodoModel(id: todo.id, title: title, description: desc, status: todo.status),
          );
        }

        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APPBAR_TODO_LIST),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.todos.isEmpty) {
            return const Center(child: Text('No todos found.'));
          }

          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return Card(
                child: ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: todo.status,
                        onChanged: (val) {
                          controller.updateTodo(
                            TodoModel(
                              id: todo.id,
                              title: todo.title,
                              description: todo.description,
                              status: val ?? false,
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => showAddOrEditDialog(todo: todo),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => controller.deleteTodo(todo.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddOrEditDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
