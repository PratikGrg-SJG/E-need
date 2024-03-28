import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_products_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  final GetAllProductsUsecase _getAllProductsUsecase;
  GetAllProductsCubit(this._getAllProductsUsecase)
      : super(GetAllProductsState());

  Future<void> getAllProducts() async {
    try {
      emit(state.copyWith(
        status: GetAllProductsStatus.loading,
        message: "Fetching all products, please wait...",
      ));

      final response = await _getAllProductsUsecase.call(CommonRequestModel());
      response.fold((failure) {
        logger(failure, loggerType: LoggerType.error);
        emit(state.copyWith(
          status: GetAllProductsStatus.failure,
          message: failure.message,
        ));
      }, (result) {
        logger(result, loggerType: LoggerType.success);
        emit(state.copyWith(
          status: GetAllProductsStatus.failure,
          message: "Products fetched successfully",
          productsResponseModel: result,
        ));
      });
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: GetAllProductsStatus.failure,
        message: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GetAllProductsStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
