import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/get_cart_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_cart_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../../core/development/console.dart';
import '../../../../../../../../../core/enums/enums.dart';
import '../../../../../../../../../services/local/secure_storage.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  final GetCartUsecase _getCartUsecase;
  GetCartCubit(this._getCartUsecase) : super(GetCartState());

  List<ProductData> cartItems = [];
  Future<void> getCart() async {
    try {
      emit(
        state.copyWith(
          status: GetCartStatus.loading,
          message: "Getting cart, please wait...",
        ),
      );

      final userId = await SharedPreference.getUserId();
      final response =
          await _getCartUsecase.call(CommonRequestModel(userId: userId));
      response.fold(
          (failure) => emit(
                state.copyWith(
                  status: GetCartStatus.failure,
                  message: failure.message,
                ),
              ), (result) {
        logger(result, loggerType: LoggerType.success);
        cartItems.clear();
        cartItems.addAll(result.data?.productData ?? []);
        emit(
          state.copyWith(
            status: GetCartStatus.success,
            message: "Cart fetched successfully",
            cartItems: result,
          ),
        );
      });
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          status: GetCartStatus.failure,
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: GetCartStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
