import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<AppFailures, AuthModel>> login(String email, String password);
  Future<Either<AppFailures, AuthModel>> register(
      {RegisterRequestModel? request});
}
