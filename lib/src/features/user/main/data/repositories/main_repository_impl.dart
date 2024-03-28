import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/api_exceptions.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/data/datasources/main_remote_datasource.dart';
import 'package:e_needs/src/features/user/main/data/models/category/category_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_request_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_response_model.dart';
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
}
