import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:works_app/src/core/cubit/generic_state.dart';
import 'package:works_app/src/core/shered.dart';
import 'package:works_app/src/features/login/domain/entities/login_entity.dart';
import 'package:works_app/src/features/login/domain/usecases/login_usecase.dart';

class LoginCubit extends Cubit<GenericState> {
  late LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(InitState());

  List<LoginEntity>? loginEntity;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool validate = false;

  void isLoggedIn(){
    emit(LoadingState());
    if(SessionManager.isLoggedIn()){
      Modular.to.pushReplacementNamed('/pets');
    }
    Future.delayed(const Duration(seconds: 1), () => emit(InitState()));
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    emit(LoadingState());
    loginEntity = await loginUseCase.call(email, password);
    if (loginEntity != null && loginRequest(loginEntity, email, password)) {
      await SessionManager.setLoggedIn(true);
      await SessionManager.setUserInfo(email, 'token');
      Modular.to.pushReplacementNamed('/pets');
      return;
    }
      Future.delayed(const Duration(seconds: 1), () => emit(InitState()));
      emit(ErrorState());
  }

  bool loginRequest(
    List<LoginEntity>? list,
    String email,
    String password,
  ) {
    for (var element in list!) {
      if (element.email == email && element.password == password) return true;
    }
    return false;
  }

  void validateBottom(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      validate = true;
      emit(LoadingState());
      emit(InitState());
      return;
    }
    validate = false;
    emit(LoadingState());
    emit(InitState());
    return;
  }

  Future<void> logout() async {
    bool logout = await loginUseCase.signOut();
    if (logout) {
      await SessionManager.setLoggedIn(false);
      await SessionManager.clearSession();
      emailController.clear();
      passwordController.clear();
      emit(InitState());
      Modular.to
          .pushNamedAndRemoveUntil(Modular.initialRoute, (value) => false);
    }
  }
}
