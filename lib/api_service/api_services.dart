import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://api.pentagoncare.online/api/v1";

  static Future<String?> login(String email, String password) async {
    final String url = "$baseUrl/auth/sign-in";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['access_token'];
      } else {
        print("Login Failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getUserProfile(String token) async {
    final String url = "$baseUrl/user/profile";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Failed to fetch profile: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
