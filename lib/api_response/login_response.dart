 
import 'package:testapp/helpers/api_helper.dart';

class LoginResponse {
  bool success;
  String message;
  Data data;

  LoginResponse({this.success = false, this.message = '', required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: APIHelper.getSafeBoolValue(json['success']),
        message: APIHelper.getSafeStringValue(json['message']),
        data: Data.getAPIResponseObjectSafeValue(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data.toJson(),
      };

  factory LoginResponse.empty() => LoginResponse(
        data: Data(),
      );
  static LoginResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? LoginResponse.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : LoginResponse.empty();
}

class Data {
  String accessToken;
  String refreshToken;
  String role;
  String id;
  String status;

  Data({
    this.accessToken = '',
    this.refreshToken = '',
    this.role = '',
    this.id = '',
    this.status = '',
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: APIHelper.getSafeStringValue(json['accessToken']),
        refreshToken: APIHelper.getSafeStringValue(json['refreshToken']),
        role: APIHelper.getSafeStringValue(json['role']),
        id: APIHelper.getSafeStringValue(json['_id']),
        status: APIHelper.getSafeStringValue(json['status']),
      );

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'role': role,
        '_id': id,
        'status': status,
      };

  static Data getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? Data.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Data();
}
