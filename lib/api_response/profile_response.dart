 
import 'package:testapp/helpers/api_helper.dart';

class ProfileResponse {
  bool success;
  String message;
  Data data;

  ProfileResponse(
      {this.success = false, this.message = '', required this.data});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      success: APIHelper.getSafeBoolValue(json['success']),
      message: APIHelper.getSafeStringValue(json['message']),
      data: Data.getAPIResponseObjectSafeValue(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data.toJson(),
      };

  factory ProfileResponse.empty() => ProfileResponse(
        data: Data.empty(),
      );
  static ProfileResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? ProfileResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : ProfileResponse.empty();
}

class Data {
  String id;
  String firstName;
  String lastName;
  String email;
  String contact;
  String profilePicture;
  List<dynamic> document;
  String role;
  String fcmToken;
  bool isActive;
  bool isDelete;
  String status;
  Validation validation;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<dynamic> shifts;

  Data({
    this.id = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.contact = '',
    this.profilePicture = '',
    this.document = const [],
    this.role = '',
    this.fcmToken = '',
    this.isActive = false,
    this.isDelete = false,
    this.status = '',
    required this.validation,
    required this.createdAt,
    required this.updatedAt,
    this.v = 0,
    this.shifts = const [],
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: APIHelper.getSafeStringValue(json['_id']),
        firstName: APIHelper.getSafeStringValue(json['firstName']),
        lastName: APIHelper.getSafeStringValue(json['lastName']),
        email: APIHelper.getSafeStringValue(json['email']),
        contact: APIHelper.getSafeStringValue(json['contact']),
        profilePicture: (json['profilePicture']),
        document: json['document'],
        role: APIHelper.getSafeStringValue(json['role']),
        fcmToken: APIHelper.getSafeStringValue(json['fcmToken']),
        isActive: APIHelper.getSafeBoolValue(json['isActive']),
        isDelete: APIHelper.getSafeBoolValue(json['isDelete']),
        status: APIHelper.getSafeStringValue(json['status']),
        validation:
            Validation.getAPIResponseObjectSafeValue(json['validation']),
        createdAt: APIHelper.getSafeDateTimeValue(json['createdAt']),
        updatedAt: APIHelper.getSafeDateTimeValue(json['updatedAt']),
        v: APIHelper.getSafeIntValue(json['__v']),
        shifts: json['shifts'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'contact': contact,
        'profilePicture': profilePicture,
        'document': document,
        'role': role,
        'fcmToken': fcmToken,
        'isActive': isActive,
        'isDelete': isDelete,
        'status': status,
        'validation': validation.toJson(),
        'createdAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(createdAt),
        'updatedAt':
            APIHelper.toServerDateTimeFormattedStringFromDateTime(updatedAt),
        '__v': v,
        'shifts': shifts,
      };

  factory Data.empty() => Data(
        validation: Validation(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
  static Data getAPIResponseObjectSafeValue(dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? Data.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Data.empty();
}

class Validation {
  bool isVerified;

  Validation({this.isVerified = false});

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        isVerified: APIHelper.getSafeBoolValue(json['isVerified']),
      );

  Map<String, dynamic> toJson() => {
        'isVerified': isVerified,
      };

  static Validation getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? Validation.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : Validation();
}
