import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/order/order_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_orders_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../../services/local/secure_storage.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final GetOrdersUsecase _getOrdersUsecase;
  GetOrdersCubit(this._getOrdersUsecase) : super(GetOrdersState());

  Future<void> getOrders() async {
    try {
      emit(
        state.copyWith(
          message: "Getting orders, please wait..",
          status: GetOrdersStatus.loading,
        ),
      );
      var userId = await SharedPreference.getUserId();
      final response = await _getOrdersUsecase.call(
        CommonRequestModel(userId: userId),
      );

      response.fold(
          (failure) => emit(
                state.copyWith(
                  message: failure.message,
                  status: GetOrdersStatus.failure,
                ),
              ), (result) {
        emit(
          state.copyWith(
            message: result.message,
            status: GetOrdersStatus.failure,
            orderResponseModel: result,
          ),
        );
      });
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          status: GetOrdersStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          message: e.toString(),
          status: GetOrdersStatus.failure,
        ),
      );
    }
  }
}
