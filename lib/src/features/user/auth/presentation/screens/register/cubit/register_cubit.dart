import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/auth/data/models/register_user_request_model.dart';
import 'package:e_needs/src/features/user/auth/domain/usecases/register_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  final RegisterUserUsecase _registerUserUsecase;

  RegisterUserCubit(this._registerUserUsecase) : super(RegisterUserState());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get addressController => _addressController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    try {
      emit(state.copyWith(
          status: RegisterUserStatus.loading,
          message: "Registering user, please wait..."));

      final response = await _registerUserUsecase.call(RegisterUserRequestModel(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      ));

      response.fold((failure) {
        emit(state.copyWith(
            status: RegisterUserStatus.failure, message: failure.message));
      }, (result) {
        logger(result, loggerType: LoggerType.success);
        emit(state.copyWith(
            status: RegisterUserStatus.success, message: result.message));
      });
    } on ApiFailure catch (e) {
      emit(state.copyWith(
          status: RegisterUserStatus.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(
          status: RegisterUserStatus.failure, message: e.toString()));
    }
  }

  void resetControllers() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }
}
