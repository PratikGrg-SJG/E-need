import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_wishlist_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:e_needs/src/services/local/secure_storage.dart';
import 'package:equatable/equatable.dart';

part 'update_wishlist_state.dart';

class UpdateWishlistCubit extends Cubit<UpdateWishlistState> {
  final UpdateWishlistUsecase _updateWishlistUsecase;
  UpdateWishlistCubit(this._updateWishlistUsecase)
      : super(UpdateWishlistState());

  Future<void> updateWishlist(
      {required bool? addToWishlist, required int? productId}) async {
    try {
      emit(state.copyWith(
          message: "Updating wishlist", status: UpdateWishlistStatus.loading));

      var userId = await SharedPreference.getUserId();

      final response = await _updateWishlistUsecase.call(CommonRequestModel(
        addToWishlist: addToWishlist,
        productId: productId,
        userId: userId,
      ));

      response.fold(
          (failure) => emit(state.copyWith(
              message: failure.message, status: UpdateWishlistStatus.failure)),
          (result) => emit(state.copyWith(
              message: result.message, status: UpdateWishlistStatus.success)));
    } on ApiException catch (e) {
      emit(state.copyWith(
          message: e.message, status: UpdateWishlistStatus.failure));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: UpdateWishlistStatus.failure));
    }
  }
}
