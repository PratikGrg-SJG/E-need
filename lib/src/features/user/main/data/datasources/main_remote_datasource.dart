import 'package:e_needs/src/core/configs/api_config.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/user_details_response_model.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:e_needs/src/services/network/api_handler.dart';

import '../models/category/category_response_model.dart';
import '../models/profile/update_profile_response_model.dart';

abstract class MainRemoteDatasource {
  Future<List<CategoryResponseModel>?> getAllCategories(
      CommonRequestModel commonRequestModel);
  Future<ProductsResponseModel> getAllProducts(
      CommonRequestModel commonRequestModel);

  Future<UserDetailsResponseModel> getUserDetails(
      CommonRequestModel commonRequestModel);

  Future<UpdateProfileResponseModel> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel);
}

class MainRemoteDatasourceImpl implements MainRemoteDatasource {
  final ApiHandler _apiHandler;
  MainRemoteDatasourceImpl(this._apiHandler);
  @override
  Future<List<CategoryResponseModel>?> getAllCategories(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler
          .get("${ApiConfig.categoryUrl}${ApiConfig.allCategoryUrl}");
      return categoryResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsResponseModel> getAllProducts(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler
          .get("${ApiConfig.productUrl}${ApiConfig.allProductUrl}");
      return productsResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserDetailsResponseModel> getUserDetails(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler
          .get("${ApiConfig.userUrl}/${commonRequestModel.userId}");
      return userDetailsResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateProfileResponseModel> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel) async {
    try {
      var response = await _apiHandler
          .post("${ApiConfig.userUrl}${ApiConfig.updateUrl}/${updateProfileRequestModel.id}",updateProfileRequestModel.toMap(), isauth: true,);
      return updateProfileResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
