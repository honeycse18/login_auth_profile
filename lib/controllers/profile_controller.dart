import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:testapp/api_response/profile_response.dart';
import 'package:testapp/controllers/login_controller.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  Rx<ProfileResponse?> profileData = Rx<ProfileResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading(true);
    try {
      final response = await http.get(
        Uri.parse("https://api.pentagoncare.online/api/v1/user/profile"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${Get.find<LoginController>().token.value}",
        },
      );

      print("Profile Status Code: ${response.statusCode}");
      print("Profile Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        profileData.value = ProfileResponse.fromJson(data);
      } else {
        Get.snackbar("Error", "Failed to load profile");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }
}
