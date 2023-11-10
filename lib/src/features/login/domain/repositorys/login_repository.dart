import 'package:works_app/src/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<List<LoginEntity>?> signUp(String email, String password);
  Future<bool> signOut();
}