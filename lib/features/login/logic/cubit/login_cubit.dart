import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/data/repo/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void emitLoginStates({required LoginRequestBody loginRequestBody}) async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(loginRequestBody);
    result.when(
        success: (loginResponse) => emit(LoginState.success(loginResponse)),
        failure: (failure) =>
            emit(LoginState.error(failure.apiErrorModel.message ?? '')));        
  }
}
