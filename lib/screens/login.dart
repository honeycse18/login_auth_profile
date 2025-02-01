import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/login_controller.dart';
import 'package:testapp/screens/profile.dart';



class LoginScreen extends StatelessWidget {
  final LoginController authController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => authController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      await authController.login(email, password);
                    },
                    child: Text("Login"),
                  )),
          ],
        ),
      ),
    );
  }
}
