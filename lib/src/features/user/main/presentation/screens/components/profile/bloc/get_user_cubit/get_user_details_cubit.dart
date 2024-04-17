import 'package:bloc/bloc.dart';
import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_user_details_usecase.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:e_needs/src/services/local/secure_storage.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../data/models/profile/user_details_response_model.dart';

part 'get_user_details_state.dart';

class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
  final GetUserDetailsUsecase _getUserDetailsUsecase;

  GetUserDetailsCubit(this._getUserDetailsUsecase)
      : super(GetUserDetailsState());

  Future<void> getUserDetails() async {
    try {
      emit(
        state.copyWith(
          message: "Getting User details, please wait...",
          status: GetUserDetailsStatus.loading,
        ),
      );

      final response = await _getUserDetailsUsecase.call(
        CommonRequestModel(
          userId: await SharedPreference.getUserId(),
        ),
      );

      response.fold((failure) {
        emit(
          state.copyWith(
            message: failure.message,
            status: GetUserDetailsStatus.failure,
          ),
        );
      }, (result) {
        logger(result, loggerType: LoggerType.success);
        _initializeControllers(result);
        emit(
          state.copyWith(
            message: "User details fetched successfully",
            status: GetUserDetailsStatus.success,
            userData: result,
          ),
        );
      });
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          status: GetUserDetailsStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
          status: GetUserDetailsStatus.failure,
        ),
      );
    }
  }

  _initializeControllers(UserDetailsResponseModel? userData) {
    sl.get<UpdateProfileCubit>().nameController.text = userData?.name ?? "";
    sl.get<UpdateProfileCubit>().emailController.text = userData?.email ?? "";
    sl.get<UpdateProfileCubit>().addressController.text =
        userData?.location ?? "";
    sl.get<UpdateProfileCubit>().phoneController.text =
        userData?.contactNumber ?? "";
  }
}
