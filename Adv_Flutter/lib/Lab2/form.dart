import 'package:flutter/material.dart';

class FormDesign extends StatefulWidget {
  const FormDesign({super.key});

  @override
  State<FormDesign> createState() => _FormDesignState();
}

class _FormDesignState extends State<FormDesign> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up form")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter Name"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Enter Email"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Enter Phone No"),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Enter Password"),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: "Enter Confirm Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // No validation implemented as per your request
                print("Name: ${nameController.text}");
                print("Email: ${emailController.text}");
                print("Phone: ${phoneController.text}");
                print("Password: ${passwordController.text}");
                print("Confirm Password: ${confirmPasswordController.text}");
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
