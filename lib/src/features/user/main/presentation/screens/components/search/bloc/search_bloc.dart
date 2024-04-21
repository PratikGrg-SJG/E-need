import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/search_products_usecase.dart';
import 'package:e_needs/src/utils/throttle_debouncer%20copy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProductsUsecase _searchProductsUsecase;
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  SearchBloc(this._searchProductsUsecase) : super(SearchState()) {
    on<SearchEvent>(_searchProducts,
        transformer: throttleRestartable(throttleDuration));
  }

  FutureOr<void> _searchProducts(
      SearchEvent event, Emitter<SearchState> emit) async {
    try {
      emit(state.copyWith(
          message: "Searching products, please wait..",
          status: SearchStatus.loading));

      final response = await _searchProductsUsecase.call(null);

      response.fold(
        (failure) => emit(state.copyWith(
            message: failure.message, status: SearchStatus.failure)),
        (result) => emit(
          state.copyWith(
            message: "Search success",
            status: SearchStatus.success,
            products: result.data,
          ),
        ),
      );
    } on ApiFailure catch (e) {
      emit(state.copyWith(message: e.message, status: SearchStatus.failure));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: SearchStatus.failure));
    }
  }
}
