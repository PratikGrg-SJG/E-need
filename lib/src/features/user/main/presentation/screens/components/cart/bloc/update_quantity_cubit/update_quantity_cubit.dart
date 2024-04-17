import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/quantity_updated_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_quantity_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

part 'update_quantity_state.dart';

class UpdateQuantityCubit extends Cubit<UpdateQuantityState> {
  final UpdateQuantityUsecase _updateQuantityUsecase;
  UpdateQuantityCubit(this._updateQuantityUsecase)
      : super(UpdateQuantityState());

  Future<void> updateQuantity(CommonRequestModel commonRequestModel) async {
    try {
      emit(
        state.copyWith(
          message: "Increasing quantity, please wait",
          status: UpdateQuantityStatus.loading,
        ),
      );

      final response = await _updateQuantityUsecase.call(commonRequestModel);

      response.fold(
        (failure) => emit(
          state.copyWith(
            message: failure.message,
            status: UpdateQuantityStatus.failure,
          ),
        ),
        (result) {
          emit(
            state.copyWith(
              message: result.message,
              status: UpdateQuantityStatus.success,
            ),
          );
        },
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          status: UpdateQuantityStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
          status: UpdateQuantityStatus.failure,
        ),
      );
    }
  }
}
