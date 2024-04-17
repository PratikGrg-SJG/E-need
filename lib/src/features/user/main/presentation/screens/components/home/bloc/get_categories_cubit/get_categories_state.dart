part of 'get_categories_cubit.dart';

enum GetCategoriesStatus {
  initial,
  loading,
  success,
  failure,
}

class GetAllCategoriesState extends Equatable {
  final String? message;
  final GetCategoriesStatus status;
  final List<CategoryResponseModel>? categories;
  const GetAllCategoriesState(
      {this.message, this.status = GetCategoriesStatus.initial, this.categories,});
  

  GetAllCategoriesState copyWith({
    String? message,
    GetCategoriesStatus? status,
    List<CategoryResponseModel>? categories,
  }) {
    return GetAllCategoriesState(
      message: message ?? this.message,
      status: status ?? this.status,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
    message,
    status,
    categories
  ];
}
