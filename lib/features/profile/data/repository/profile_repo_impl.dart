import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/profile/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce_shop/features/profile/data/models/address_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/addresses_model.dart';
import 'package:ecommerce_shop/features/profile/data/models/change_password_response.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_response.dart';
import 'package:ecommerce_shop/features/profile/data/models/user_model.dart';
import 'package:ecommerce_shop/features/profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../../../core/logic/failures/remote_failures.dart';
import '../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl(this.profileRemoteDataSource);
  @override
  Future<Either<AppFailures, UserModel>> getUser() async {
    try {
      var result = await profileRemoteDataSource.getUser();
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
  Future<Either<AppFailures, ChangePasswordResponse>> changePassword(
      String newPassword) async {
    try {
      var result = await profileRemoteDataSource.changePassword(newPassword);
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
  Future<Either<AppFailures, AddressesModel>> addAddress(
      {AddressRequest? request}) async {
    try {
      var result = await profileRemoteDataSource.addAddress(request: request);
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
  Future<Either<AppFailures, PaymentResponse>> pay(
      {PaymentRequest? request}) async {
    try {
      var result = await profileRemoteDataSource.pay(request: request);
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
