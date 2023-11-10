import 'package:works_app/src/features/login/domain/entities/login_entity.dart';
import 'package:works_app/src/features/login/domain/repositorys/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<List<LoginEntity>?> signUp(String email, String password) async {
    return null;
  }
  @override
  Future<bool> signOut() async {
    return true;
  }
}