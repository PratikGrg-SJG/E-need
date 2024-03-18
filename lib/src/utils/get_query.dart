import '../models/query_request_model.dart';

String? getQuery(QueryRequestModel? queryRequestModel) {
  String fullquery = '?';

  if (queryRequestModel?.limit != null) {
    fullquery += "size=${queryRequestModel?.limit}";
  } else {
    fullquery += "size=20";
  }

  if (queryRequestModel?.page != null) {
    fullquery += "&page=${queryRequestModel?.page}";
  } else {
    fullquery += "&page=1";
  }

  if (queryRequestModel?.foodCategoryId != null) {
    fullquery += "&category=${queryRequestModel?.foodCategoryId}";
  }

  if (queryRequestModel?.dropdownTarget != null) {
    fullquery += "&target=${queryRequestModel?.dropdownTarget}";
  }

  if (queryRequestModel?.latitude != null) {
    fullquery += "&latitude=${queryRequestModel?.latitude}";
  }

  if (queryRequestModel?.longitude != null) {
    fullquery += "&longitude=${queryRequestModel?.longitude}";
  }

  if (queryRequestModel?.rangeInKm != null) {
    fullquery += "&rangeInKm=${queryRequestModel?.rangeInKm}";
  }

  if (queryRequestModel?.isVerifiedAgrovet == true) {
    fullquery += "&verified=${queryRequestModel?.isVerifiedAgrovet}";
  }

  if (queryRequestModel?.enterprisesFilterList != null &&
      (queryRequestModel?.enterprisesFilterList?.isNotEmpty ?? false)) {
    queryRequestModel?.enterprisesFilterList?.forEach((element) {
      fullquery += "&enterprises=$element";
    });
  }
  if (queryRequestModel?.foodProductsFilterList != null &&
      (queryRequestModel?.foodProductsFilterList?.isNotEmpty ?? false)) {
    queryRequestModel?.foodProductsFilterList?.forEach((element) {
      fullquery += "&categories=$element";
    });
  }

  if (queryRequestModel?.search != "" && queryRequestModel?.search != null) {
    fullquery += "&search=${queryRequestModel?.search?.replaceAll(' ', '')}";
  }

  if (queryRequestModel?.isDraft != null) {
    fullquery += "&isDraft=${queryRequestModel?.isDraft}";
  }

  return fullquery == '?' ? '' : fullquery;
}
