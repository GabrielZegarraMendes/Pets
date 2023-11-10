import 'package:works_app/src/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    super.email,
    super.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    email : json['email'] ?? '',
    password : json['password'] ?? '',
  );
}
