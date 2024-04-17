import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_wishlist_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../../services/local/secure_storage.dart';
import '../../../../../../data/models/wishlist/wishlist_response_model.dart';

part 'get_wishlist_state.dart';

class GetWishlistCubit extends Cubit<GetWishlistState> {
  final GetWishlistUsecase _getWishlistUsecase;
  GetWishlistCubit(this._getWishlistUsecase) : super(GetWishlistState());

  Future<void> getWishlist() async {
    try {
      emit(state.copyWith(
          message: "Getting wishlist, please wait",
          status: GetWishlistStatus.loading));
      var userId = await SharedPreference.getUserId();
      final response = await _getWishlistUsecase.call(CommonRequestModel(
        userId: userId,
      ));

      response.fold(
          (failure) => emit(state.copyWith(
              message: failure.message, status: GetWishlistStatus.failure)),
          (result) => emit(state.copyWith(
                message: "Wishlist fetched",
                status: GetWishlistStatus.success,
                wishlist: result,
              )));
    } on ApiException catch (e) {
      emit(state.copyWith(
          message: e.message, status: GetWishlistStatus.failure));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: GetWishlistStatus.failure));
    }
  }
}
