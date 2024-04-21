import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_products_by_category.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

part 'get_products_by_category_state.dart';

class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  final GetProductsByCategoryUsecase _getProductsByCategoryUsecase;
  GetProductsByCategoryCubit(this._getProductsByCategoryUsecase)
      : super(GetProductsByCategoryState());

  Future<void> getProductsByCategory({required int categoryId}) async {
    try {
      emit(state.copyWith(
          message: "Getting products by category, please wait...",
          status: GetProductsByCategoryStatus.loading));

      final response = await _getProductsByCategoryUsecase
          .call(CommonRequestModel(categoryId: categoryId));
      response.fold(
          (failure) => emit(state.copyWith(
              message: failure.message,
              status: GetProductsByCategoryStatus.failure)),
          (result) => emit(state.copyWith(
              message: "Products fetched",
              status: GetProductsByCategoryStatus.success,
              products: result)));
    } on ApiFailure catch (e) {
      emit(state.copyWith(
          message: e.message, status: GetProductsByCategoryStatus.failure));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: GetProductsByCategoryStatus.failure));
    }
  }
}
