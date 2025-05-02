import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/profile/data/models/addresses_model.dart';

import '../../data/models/address_request.dart';
import '../../data/models/change_password_response.dart';
import '../../data/models/payment_request.dart';
import '../../data/models/payment_response.dart';
import '../../data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<AppFailures, UserModel>> getUser();
  Future<Either<AppFailures, ChangePasswordResponse>> changePassword(
      String newPassword);
  Future<Either<AppFailures, AddressesModel>> addAddress(
      {AddressRequest? request});
  Future<Either<AppFailures, PaymentResponse>> pay({PaymentRequest? request});
}
