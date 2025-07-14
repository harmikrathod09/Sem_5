import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class UserView extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Users')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: controller.filterUsers,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.filteredUsers.isEmpty) {
                return const Center(child: Text("No users found."));
              }

              return ListView.builder(
                itemCount: controller.filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = controller.filteredUsers[index];
                  return ListTile(
                    title: Text(user.name ?? 'No Name'),
                    subtitle: Text(user.email ?? ''),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getUsers,
        child: const Icon(Icons.add),
      ),
    );
  }
}
