import 'package:firebase_auth/firebase_auth.dart';
import 'package:works_app/src/features/login/data/models/login_model.dart';
import 'package:works_app/src/features/login/data/providers/login_json.dart';
import 'package:works_app/src/features/login/data/repositorys/login_repository.dart';
import 'package:works_app/src/features/login/domain/entities/login_entity.dart';

class LoginDatasourceImpl implements LoginRepositoryImpl{
  @override
  Future<List<LoginEntity>?> signUp(String email, String password) async {
    try {
      List<LoginModel> loginModel = loginJson.map((json) => LoginModel.fromJson(json)).toList();
      return loginModel;
    } catch (e) {
      print('Erro de login: $e');
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    return true;
  }
}