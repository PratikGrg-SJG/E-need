import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_categories_usecase.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../data/models/category/category_response_model.dart';

part 'get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  final GetAllCategoriesUsecase _getAllCategoriesUsecase;
  GetAllCategoriesCubit(this._getAllCategoriesUsecase)
      : super(GetAllCategoriesState());

  Future<void> getAllCategories() async {
    try {
      emit(state.copyWith(
          status: GetAllCategoriesStatus.loading,
          message: "Getting all categories, please wait..."));

      final response =
          await _getAllCategoriesUsecase.call(CommonRequestModel());

      response.fold((failure) {
        logger(failure, loggerType: LoggerType.error);
        emit(state.copyWith(
            status: GetAllCategoriesStatus.failure, message: failure.message));
      }, (result) {
        logger(result, loggerType: LoggerType.success);
        emit(state.copyWith(
          status: GetAllCategoriesStatus.failure,
          message: "categories fetch Success",
          categories: result,
        ));
      });
    } on ApiFailure catch (e) {
      emit(state.copyWith(
          status: GetAllCategoriesStatus.failure, message: e.message));
    } catch (e) {
      emit(state.copyWith(
          status: GetAllCategoriesStatus.failure, message: e.toString()));
    }
  }
}
