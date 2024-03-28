import 'package:dartz/dartz.dart';
import 'package:e_needs/src/core/error/failures.dart';
import 'package:e_needs/src/features/user/main/data/models/category/category_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/update_profile_response_model.dart';
import 'package:e_needs/src/features/user/main/data/models/profile/user_details_response_model.dart';
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
}
