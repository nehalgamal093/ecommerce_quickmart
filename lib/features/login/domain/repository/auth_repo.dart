import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/login/data/models/auth_model.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepo{
  Future<Either<AppFailures,AuthModel>>login(String email,String password);
}