import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_request_model.dart';
import 'package:e_needs/src/features/user/auth/data/models/login_response_model.dart';
import 'package:e_needs/src/features/user/auth/domain/usecases/login_usecase.dart';
import 'package:e_needs/src/services/local/secure_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/error/failures.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  LoginCubit(this._loginUsecase) : super(LoginState());

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void resetControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  Future<void> login() async {
    try {
      emit(state.copyWith(
          status: LoginStatus.loading, message: "logging in, please wait..."));
      final response = await _loginUsecase.call(LoginRequestModel(
          email: _emailController.text, password: _passwordController.text));
      response.fold((failure) {
        emit(state.copyWith(
            status: LoginStatus.failure, message: "Incorrect Credentials"));
      }, (result) {
        SharedPreference.setAuthToken(result.token ?? '');
        SharedPreference.setUserId(result.data?.id ?? 0);
        logger(result, loggerType: LoggerType.success);
        emit(state.copyWith(
            status: LoginStatus.success, loginResponseModel: result));
      });
    } on ApiFailure catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, message: e.toString()));
    }
  }
}
