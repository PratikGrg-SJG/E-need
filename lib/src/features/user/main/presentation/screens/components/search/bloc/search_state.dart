part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  success,
  failure,
  loading,
}

class SearchState extends Equatable {
  final String? message;
  final SearchStatus status;
  final List<Products>? products;
  const SearchState({
    this.message,
    this.status = SearchStatus.initial,
    this.products,
  });

  SearchState copyWith(
          {String? message, SearchStatus? status, List<Products>? products}) =>
      SearchState(
          message: message ?? this.message,
          status: status ?? this.status,
          products: products ?? this.products);

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}
