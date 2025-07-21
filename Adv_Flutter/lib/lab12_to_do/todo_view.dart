import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adv_flutter/lab12_to_do/todo_controller.dart';
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

    showDialog(
      context: Get.context!,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(todo == null ? 'Add Todo' : 'Edit Todo'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel',style: TextStyle(color: Colors.black87),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
              onPressed: () {
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
                    TodoModel(
                      id: todo.id,
                      title: title,
                      description: desc,
                      status: todo.status,
                    ),
                  );
                }

                Get.back();
              },
              child: Text(todo == null ? 'Add' : 'Update',style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APPBAR_TODO_LIST, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
        centerTitle: true,
        elevation: 4,
      ),
      body: Obx(() {
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.description),
                    const SizedBox(height: 4),
                    Text(
                      todo.status ? 'Completed' : 'Pending',
                      style: TextStyle(
                        color: todo.status ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: todo.status,
                      onChanged: (val) {
                        controller.updateTodo(TodoModel(
                          id: todo.id,
                          title: todo.title,
                          description: todo.description,
                          status: val ?? false,
                        ));
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showAddOrEditDialog(),
        icon: const Icon(Icons.add,color: Colors.white,),
        label: const Text('Add Todo',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
