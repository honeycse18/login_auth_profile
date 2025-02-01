import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/api_response/login_response.dart';
import 'package:testapp/screens/profile.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var token = "".obs;

  Future<void> login(String email, String password) async {
    isLoading(true);
    const String url = "https://api.pentagoncare.online/api/v1/auth/sign-in";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        LoginResponse loginResponse = LoginResponse.fromJson(data);

        if (loginResponse.success) {
          token.value = loginResponse.data.accessToken;
          Get.to(() => ProfileScreen()); // Navigate to Profile Screen
        } else {
          Get.snackbar("Error", loginResponse.message);
        }
      } else {
        Get.snackbar("Login Failed", "Invalid email or password");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
