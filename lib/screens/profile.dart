import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controllers/login_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("User Profile")),
          body: Center(
            child: Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name: ${controller.profileData.value?.data.firstName ?? 'N/A'} ${controller.profileData.value?.data.lastName ?? 'N/A'}",
                  ),
                  Text(
                    "Email: ${controller.profileData.value?.data.email ?? 'N/A'}",
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(
                          "/"); // Logout and return to login screen
                    },
                    child: Text("Logout"),
                  ),
                ],
              );
            
            }),
          ),
        );
      },
    );
  }
}
