import 'package:works_app/src/features/login/domain/entities/login_entity.dart';
import 'package:works_app/src/features/login/domain/repositorys/login_repository.dart';

abstract class LoginUseCase {
  Future<List<LoginEntity>?>call(String email, String password);
  Future<bool> signOut();
}

class LoginUseCaseImpl implements LoginUseCase{

  final LoginRepository repository;
  LoginUseCaseImpl(this.repository);

  @override
  Future<List<LoginEntity>?> call(String email, String password) async {
    var result = await repository.signUp(email, password);
    return result;
  }

  @override
  Future<bool> signOut() async {
    var result = await repository.signOut();
    return result;
  }
}