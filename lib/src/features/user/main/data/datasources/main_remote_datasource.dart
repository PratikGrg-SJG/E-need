import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/configs/api_config.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/add_to_cart_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/common_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/order/order_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/user_details_response_model.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/search/bloc/search_bloc.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:e_needs/src/services/network/api_handler.dart';

import '../models/cart/add_to_cart_response_model.dart';
import '../models/cart/get_cart_response_model.dart';
import '../models/cart/quantity_updated_response_model.dart';
import '../models/category/category_response_model.dart';
import '../models/order/add_order_response_model.dart';
import '../models/profile/update_profile_response_model.dart';
import '../models/wishlist/wishlist_response_model.dart';

abstract class MainRemoteDatasource {
  Future<List<CategoryResponseModel>?> getAllCategories(
      CommonRequestModel commonRequestModel);
  Future<ProductsResponseModel> getAllProducts(
      CommonRequestModel commonRequestModel);
  Future<ProductsResponseModel> getProductsByCategory(
      CommonRequestModel commonRequestModel);

  Future<UserDetailsResponseModel> getUserDetails(
      CommonRequestModel commonRequestModel);

  Future<UpdateProfileResponseModel> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel);

  Future<AddToCartResponseModel> addToCart(
      AddToCartRequestModel addToCartRequestModel);

  Future<GetCartResponseModel> getCart(CommonRequestModel commonRequestModel);

  Future<QuantityUpdatedResponseModel> updateQuantity(
      CommonRequestModel commonRequestModel);

  Future<OrderResponseModel> getOrders(CommonRequestModel commonRequestModel);
  Future<AddOrderResponseModel> addOrder(CommonRequestModel commonRequestModel);

  Future<List<WishlistResponseModel>> getWishList(
      CommonRequestModel commonRequestModel);

  Future<CommonResponseModel> updateWishlist(
      CommonRequestModel commonRequestModel);

  Future<ProductsResponseModel> searchProducts();
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
      console(" ${updateProfileRequestModel.toMap()}");
      var response = await _apiHandler.post(
        "${ApiConfig.userUrl}${ApiConfig.updateUrl}/${updateProfileRequestModel.id}",
        updateProfileRequestModel.toMap(),
        isauth: true,
      );
      return updateProfileResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AddToCartResponseModel> addToCart(
      AddToCartRequestModel addToCartRequestModel) async {
    try {
      console("payload :: ${addToCartRequestModel.toMap()}");
      var response = await _apiHandler.post(
        "${ApiConfig.cartUrl}${ApiConfig.createUrl}",
        addToCartRequestModel.toMap(),
        isauth: true,
      );
      return addToCartResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetCartResponseModel> getCart(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler.get(
        "${ApiConfig.cartUrl}${ApiConfig.userUrl}/${commonRequestModel.userId}",
        isauth: true,
      );
      console("from datasource :: $response");
      return getCartResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<QuantityUpdatedResponseModel> updateQuantity(
    CommonRequestModel commonRequestModel,
  ) async {
    try {
      var response = await _apiHandler.get(
        commonRequestModel.isQtyIncrease == true
            ? "${ApiConfig.cartUrl}${ApiConfig.increaseQuantityUrl}/${commonRequestModel.userId}/${commonRequestModel.productId}"
            : "${ApiConfig.cartUrl}${ApiConfig.decreaseQuantityUrl}/${commonRequestModel.userId}/${commonRequestModel.productId}",
        isauth: true,
      );
      return quantityUpdatedResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OrderResponseModel> getOrders(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler.get(
        "${ApiConfig.orderUrl}${ApiConfig.userUrl}/${commonRequestModel.userId}",
        isauth: true,
      );
      return orderResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AddOrderResponseModel> addOrder(
      CommonRequestModel commonRequestModel) async {
    Map<String, dynamic> payload = {
      "user_id": commonRequestModel.userId,
    };

    if (commonRequestModel.paymentMethod == PaymentMethod.cashInHand) {
      payload['payment_method'] = "cash_in_hand";
    } else {
      payload['payment_method'] = "khalti";
    }

    try {
      var response = await _apiHandler.post(
        "${ApiConfig.orderUrl}${ApiConfig.createUrl}",
        payload,
        isauth: true,
      );
      return addOrderResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<WishlistResponseModel>> getWishList(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler.get(
        "${ApiConfig.favoriteUrl}${ApiConfig.userUrl}/${commonRequestModel.userId}",
        isauth: true,
      );
      return wishlistResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponseModel> updateWishlist(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler.get(
        "${ApiConfig.favoriteUrl}${commonRequestModel.addToWishlist == true ? ApiConfig.addUrl : ApiConfig.removeUrl}/${commonRequestModel.userId}/${commonRequestModel.productId}",
        isauth: true,
      );
      return commonResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsResponseModel> getProductsByCategory(
      CommonRequestModel commonRequestModel) async {
    try {
      var response = await _apiHandler.get(
        "${ApiConfig.productUrl}${ApiConfig.categoryUrl}/${commonRequestModel.categoryId}",
        isauth: true,
      );
      return productsResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductsResponseModel> searchProducts() async {
    try {
      var response = await _apiHandler.get(
        "${ApiConfig.productUrl}${ApiConfig.searchUrl}/${sl.get<SearchBloc>().searchController.text}",
        isauth: true,
      );
      return productsResponseModelFromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
