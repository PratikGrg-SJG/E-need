import 'package:bloc/bloc.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_categories_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../../core/development/console.dart';
import '../../../../../../../../../core/enums/enums.dart';
import '../../../../../../../../../core/error/api_exceptions.dart';
import '../../../../../../../../../models/common_request_model.dart';
import '../../../../../../data/models/category/category_response_model.dart';

part 'get_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  final GetAllCategoriesUsecase _getAllCategoriesUsecase;
  GetAllCategoriesCubit(this._getAllCategoriesUsecase)
      : super(GetAllCategoriesState());

  Future<void> getAllCategories() async {
    try {
      emit(state.copyWith(
        status: GetCategoriesStatus.loading,
        message: "Fetching all products, please wait...",
      ));

      final response =
          await _getAllCategoriesUsecase.call(CommonRequestModel());
      response.fold((failure) {
        logger(failure, loggerType: LoggerType.error);
        emit(state.copyWith(
          status: GetCategoriesStatus.failure,
          message: failure.message,
        ));
      }, (result) {
        logger(result, loggerType: LoggerType.success);
        emit(state.copyWith(
          status: GetCategoriesStatus.failure,
          message: "Products fetched successfully",
          categories: result,
        ));
      });
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: GetCategoriesStatus.failure,
        message: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GetCategoriesStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
