import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/add_to_cart_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/add_to_cart_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/get_cart_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/quantity_updated_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/category/category_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/order/add_order_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/order/order_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/user_details_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/wishlist/wishlist_response_model.dart';
import 'package:e_needs/src/models/common_request_model.dart';

import '../../data/models/profile/update_profile_request_model.dart';

abstract class MainRepository {
  Future<Either<Failure, List<CategoryResponseModel>?>> getAllCategories(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, ProductsResponseModel>> getAllProducts(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, UserDetailsResponseModel>> getUserDetails(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, UpdateProfileResponseModel>> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel);
  Future<Either<Failure, AddToCartResponseModel>> addToCart(
      AddToCartRequestModel addToCartRequestModel);
  Future<Either<Failure, GetCartResponseModel>> getCart(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, QuantityUpdatedResponseModel>> updateQuantity(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, OrderResponseModel>> getOrders(
      CommonRequestModel commonRequestModel);

  Future<Either<Failure, AddOrderResponseModel>> addOrder(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, List<WishlistResponseModel>>> getWishlist(
      CommonRequestModel commonRequestModel);
  Future<Either<Failure, String>> updateWishlist(
      CommonRequestModel commonRequestModel);
}
