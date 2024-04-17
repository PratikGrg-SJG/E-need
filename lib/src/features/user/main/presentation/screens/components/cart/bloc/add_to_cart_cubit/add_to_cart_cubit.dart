import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/add_to_cart_request_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/add_to_cart_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../../services/local/secure_storage.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUsecase _addToCartUsecase;
  AddToCartCubit(this._addToCartUsecase) : super(AddToCartState());

  Future<void> addToCart({required int productId}) async {
    try {
      emit(state.copyWith(
          status: AddToCartStatus.loading,
          message: "Adding to cart, please wait..."));
      console("Loading");   final userId = await SharedPreference.getUserId();
      final response = await _addToCartUsecase.call(AddToCartRequestModel(
        productId: "$productId",
        quantity: "1",
        userId: "$userId",
      ));

      response.fold(
          (failure) => emit(state.copyWith(
              status: AddToCartStatus.failure,
              message: failure.message)), (result) {
        logger(result.data, loggerType: LoggerType.success);
        emit(state.copyWith(
          status: AddToCartStatus.success,
          message: "Added To Cart",
        ));
      });
    } on ApiException catch (e) {
      emit(state.copyWith(status: AddToCartStatus.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(
          status: AddToCartStatus.failure, message: e.toString()));
    }
  }
}
