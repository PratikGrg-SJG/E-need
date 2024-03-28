part of 'get_all_categories_cubit.dart';

enum GetAllCategoriesStatus {
  initial,
  loading,
  success,
  failure,
}

class GetAllCategoriesState extends Equatable {
  final String? message;
  final GetAllCategoriesStatus status;
  final List<CategoryResponseModel>? categories;
  const GetAllCategoriesState({
    this.message,
    this.status = GetAllCategoriesStatus.initial,
    this.categories,
  });

  GetAllCategoriesState copyWith({
    String? message,
    GetAllCategoriesStatus? status,
    List<CategoryResponseModel>? categories,
  }) =>
      GetAllCategoriesState(
        message: message ?? this.message,
        status: status ?? this.status,
        categories: categories ?? this.categories,
      );

  @override
  List<Object?> get props => [
        message,
        status,
        categories,
      ];
}
