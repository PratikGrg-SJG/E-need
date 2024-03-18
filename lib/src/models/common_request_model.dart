class CommonRequestModel {
  final int? page;
  final int? limit;
  final int? entityId;
  final int? foodCategoryId;
  final String? dropdownTarget;
  final double? latitude;
  final double? longitude;
  final int? rangeInKm;
  final String? search;
  final bool? isVerifiedAgrovet;
  final List<dynamic>? enterprisesFilterList;
  final List<dynamic>? foodProductsFilterList;
  final int? farmId;
  final int? foodId;
  final int? agrovetId;
  final int? categoryId;
  final int? sellerId;
  final bool? isDraft;

  CommonRequestModel({
    this.dropdownTarget,
    this.page,
    this.limit,
    this.entityId,
    this.sellerId,
    this.foodCategoryId,
    this.latitude,
    this.longitude,
    this.rangeInKm,
    this.search,
    this.isVerifiedAgrovet,
    this.enterprisesFilterList,
    this.foodProductsFilterList,
    this.farmId,
    this.foodId,
    this.agrovetId,
    this.categoryId,
    this.isDraft,
  });
}
