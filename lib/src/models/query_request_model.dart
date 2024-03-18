class QueryRequestModel {
  final String? query;
  final String? role;
  final dynamic page;
  final dynamic limit;
  final int? foodCategoryId;
  final String? dropdownTarget;
  final double? latitude;
  final double? longitude;
  final int? rangeInKm;
  final String? search;
  final bool? isVerifiedAgrovet;
  final List<dynamic>? enterprisesFilterList;
  final List<dynamic>? foodProductsFilterList;
  final bool? isDraft;

  QueryRequestModel({
    this.query,
    this.role,
    this.page,
    this.limit,
    this.foodCategoryId,
    this.dropdownTarget,
    this.latitude,
    this.longitude,
    this.rangeInKm,
    this.search,
    this.isVerifiedAgrovet,
    this.enterprisesFilterList,
    this.foodProductsFilterList,
    this.isDraft,
  });
}
