import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_shop/features/auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_shop/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';
import 'package:ecommerce_shop/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/caching/cache_helper.dart';
import '../../../../core/logic/failures/failures.dart';
import '../../../../core/logic/failures/remote_failures.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<AppFailures, AuthModel>> login(
      String email, String password) async {
    try {
      var result = await authRemoteDataSource.login(email, password);
      CacheHelper.saveToken(result.token!);
      CacheHelper.saveUserId(result.id!);
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(
        RemoteFailures("An unexpected error occurred"),
      );
    }
  }

  @override
  Future<Either<AppFailures, AuthModel>> register(
      {RegisterRequestModel? request}) async {
    try {
      var result = await authRemoteDataSource.register(request: request);

      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } catch (e) {
      return Left(
        RemoteFailures("An unexpected error occurred"),
      );
    }
  }
}
