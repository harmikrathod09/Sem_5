import 'package:flutter/material.dart';
import 'user_firebase_controller.dart';
import 'user_firebase_model.dart';

class UserViewFirebase extends StatefulWidget {
  const UserViewFirebase({super.key});

  @override
  State<UserViewFirebase> createState() => _UserViewFirebaseState();
}

class _UserViewFirebaseState extends State<UserViewFirebase> {
  final UserFirebaseController _controller = UserFirebaseController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _addUser() async {
    if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
      await _controller.addUser(_nameController.text, _emailController.text);
      _nameController.clear();
      _emailController.clear();
    }
  }

  void _updateUser(UserFirebaseModel user) {
    _nameController.text = user.name;
    _emailController.text = user.email;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Update User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: "Email")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await _controller.updateUser(user.id, _nameController.text, _emailController.text);
              Navigator.pop(ctx);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase User CRUD (MVC)")),
      body: Column(
        children: [
          // Input fields
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Name")),
                TextField(controller: _emailController, decoration: const InputDecoration(labelText: "Email")),
                ElevatedButton(onPressed: _addUser, child: const Text("Add User")),
              ],
            ),
          ),

          const Divider(),

          // User List from Firestore
          Expanded(
            child: StreamBuilder<List<UserFirebaseModel>>(
              stream: _controller.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No users found"));
                }

                final users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (ctx, index) {
                    final user = users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: const Icon(Icons.edit), onPressed: () => _updateUser(user)),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await _controller.deleteUser(user.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
