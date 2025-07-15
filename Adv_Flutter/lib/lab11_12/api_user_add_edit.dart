import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';


class UserFormView extends StatelessWidget {
  final UserController controller = Get.find();
  final User? user;

  UserFormView({super.key, this.user});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      nameController.text = user!.name ?? '';
      emailController.text = user!.email ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(APPBAR_ADD_EDIT_PAGE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: NAME),
                validator: (value) =>
                value == null || value.isEmpty ? ENTER_NAME : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: EMAIL),
                validator: (value) =>
                value == null || value.isEmpty ? ENTER_EMAIL : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newUser = User(
                      id: user?.id ??
                          DateTime.now().millisecondsSinceEpoch.toString(),
                      name: nameController.text,
                      email: emailController.text,
                    );

                    if (user == null) {
                      await controller.addUser(newUser);
                    } else {
                      await controller.editUser(newUser);
                    }
                    Get.back(); // Close form after action
                  }
                },
                child: Text(BTN_SUBMIT),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
