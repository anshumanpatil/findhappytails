
import 'dart:convert';
// {
// "_id": "651db183fd3c3acce0db88db",
// "email": "demo@a.com",
// "password": "demo1234",
// "userid": "651db183fd3c3acce0db88db"
// }
class LoginResult {
  String id;
  String email;
  String userid;

  LoginResult({
    required this.id,
    required this.email,
    required this.userid,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "userid": userid,
  };

  factory LoginResult.fromJson(dynamic json) {

    return LoginResult(
      id: jsonDecode(json)['_id'],
      email: jsonDecode(json)['email'],
      userid: jsonDecode(json)['userid'],
    );
  }
}