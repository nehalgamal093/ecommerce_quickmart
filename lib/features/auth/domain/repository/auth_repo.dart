import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/auth/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';


abstract class AuthRepo{
  Future<Either<AppFailures,AuthModel>>login(String email,String password);
  Future<Either<AppFailures,AuthModel>>register({RegisterRequestModel? request});
}