import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/data/datasources/main_remote_datasource.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/add_to_cart_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/add_to_cart_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/get_cart_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/cart/quantity_updated_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/category/category_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/order/add_order_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/order/order_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/wishlist/wishlist_response_model.dart';
import 'package:e_needs/src/models/common_request_model.dart';

import '../../domain/repositories/main_repository.dart';
import '../models/profile/user_details_response_model.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDatasource _mainRemoteDatasource;
  MainRepositoryImpl(this._mainRemoteDatasource);
  @override
  Future<Either<Failure, List<CategoryResponseModel>?>> getAllCategories(
      CommonRequestModel commonRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.getAllCategories(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductsResponseModel>> getAllProducts(
      CommonRequestModel commonRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.getAllProducts(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserDetailsResponseModel>> getUserDetails(
      CommonRequestModel commonRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.getUserDetails(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileResponseModel>> updateProfile(
      UpdateProfileRequestModel updateProfileRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.updateProfile(updateProfileRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddToCartResponseModel>> addToCart(
      AddToCartRequestModel addToCartRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.addToCart(addToCartRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetCartResponseModel>> getCart(
      CommonRequestModel commonRequestModel) async {
    try {
      final response = await _mainRemoteDatasource.getCart(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuantityUpdatedResponseModel>> updateQuantity(
      CommonRequestModel commonRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.updateQuantity(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderResponseModel>> getOrders(
      CommonRequestModel commonRequestModel) async {
    try {
      final response =
          await _mainRemoteDatasource.getOrders(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddOrderResponseModel>> addOrder(CommonRequestModel commonRequestModel)async {
 try {
      final response =
          await _mainRemoteDatasource.addOrder(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WishlistResponseModel>>> getWishlist(CommonRequestModel commonRequestModel)async {
 try {
      final response =
          await _mainRemoteDatasource.getWishList(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateWishlist(CommonRequestModel commonRequestModel)async {
   try {
      final response =
          await _mainRemoteDatasource.updateWishlist(commonRequestModel);
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message.toString()));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
