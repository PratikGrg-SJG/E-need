import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/order/add_order_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/add_order_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:e_needs/src/services/local/secure_storage.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final AddOrderUsecase _addOrderUsecase;
  AddOrderCubit(this._addOrderUsecase) : super(AddOrderState());

  Future<void> addOrder({required PaymentMethod paymentMethod}) async {
    try {
      emit(state.copyWith(
          message: "Adding order, please wait...",
          status: AddOrderStatus.loading));

      var userId = await SharedPreference.getUserId();

      final response = await _addOrderUsecase.call(
          CommonRequestModel(userId: userId, paymentMethod: paymentMethod));

      response.fold(
          (failure) => emit(state.copyWith(
              message: failure.message, status: AddOrderStatus.failure)),
          (result) => emit(state.copyWith(
                message: result.message,
                status: AddOrderStatus.success,
                addOrderResponseModel: result,
              )));
    } on ApiException catch (e) {
      emit(state.copyWith(message: e.message, status: AddOrderStatus.failure));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: AddOrderStatus.failure));
    }
  }
}
