import 'package:bloc/bloc.dart';
import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/auth/data/models/verifyOtp_request_model.dart';
import 'package:e_needs/src/features/user/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'opt_verify_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final TextEditingController _otpCodeOneController = TextEditingController();
  final TextEditingController _otpCodeTwoController = TextEditingController();
  final TextEditingController _otpCodeThreeController = TextEditingController();
  final TextEditingController _otpCodeFourController = TextEditingController();

  TextEditingController get otpCodeOneController => _otpCodeOneController;
  TextEditingController get otpCodeTwoController => _otpCodeTwoController;
  TextEditingController get otpCodeThreeController => _otpCodeThreeController;
  TextEditingController get otpCodeFourController => _otpCodeFourController;

  final VerifyOtpUseCase _verifyOtpUseCase;
  VerifyOtpCubit(this._verifyOtpUseCase) : super(VerifyOtpState());

  Future<void> verifyOtp() async {
    try {
      emit(state.copyWith(
          message: "Verifying otp, please wait...",
          status: VerifyStatus.loading));

      final response = await _verifyOtpUseCase.call(
        VerifyOtpRequestModel(
          email: sl.get<RegisterUserCubit>().emailController.text,
          otp:
              "${_otpCodeOneController.text}${_otpCodeTwoController.text}${_otpCodeThreeController.text}${_otpCodeFourController.text}",
          type: "emailVerification",
        ),
      );

      response.fold(
          (failure) => emit(state.copyWith(
              message: failure.message, status: VerifyStatus.failure)),
          (result) => emit(state.copyWith(
              message: "Otp verified", status: VerifyStatus.success)));
    } on ApiFailure catch (e) {
      emit(state.copyWith(message: e.message, status: VerifyStatus.failure));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: VerifyStatus.failure));
    }
  }
}
