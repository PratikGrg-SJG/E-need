import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_request_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_profile_usecase.dart';
import 'package:e_needs/src/services/local/secure_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUsecase _updateProfileUsecase;
  UpdateProfileCubit(this._updateProfileUsecase) : super(UpdateProfileState());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get addressController => _addressController;
  TextEditingController get phoneController => _phoneController;

  Future<void> updateProfile() async {
    try {
      emit(state.copyWith(
          message: "Updating profile, please wait..",
          status: UpdateProfileStatus.loading));

      final response =
          await _updateProfileUsecase.call(UpdateProfileRequestModel(
        id: SharedPreference.getUserId(),
        name: _nameController.text,
        email: _emailController.text,
        address: _addressController.text,
        phoneNumber: _phoneController.text,
      ));

      response.fold((failure) {
        emit(state.copyWith(
          message: failure.message,
          status: UpdateProfileStatus.failure,
        ));
      }, (result) {
        logger(result, loggerType: LoggerType.success);
        emit(state.copyWith(
          message: result.message,
          status: UpdateProfileStatus.success,
        ));
      });
    } on ApiException catch (e) {
      emit(state.copyWith(
          message: e.message, status: UpdateProfileStatus.failure));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: UpdateProfileStatus.failure));
    }
  }
}
