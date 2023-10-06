
import 'dart:convert';

class LoginResult {
  String token;
  String email;
  String name;
  String mobile;
  String status;

  LoginResult({
    required this.token,
    required this.email,
    required this.name,
    required this.mobile,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    "token": token,
    "email": email,
    "name": name,
    "mobile": mobile,
    "status": status,
  };

  factory LoginResult.fromJson(dynamic json) {

    return LoginResult(
      token: jsonDecode(json)['token'],
      email: jsonDecode(json)['email'],
      name: jsonDecode(json)['name'],
      mobile: jsonDecode(json)['mobile'],
      status: jsonDecode(json)['status'],
    );
  }
}