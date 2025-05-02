import 'package:ecommerce_shop/features/profile/data/models/address_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/addresses_model.dart';
import 'package:ecommerce_shop/features/profile/data/models/user_model.dart';

import '../../models/change_password_response.dart';
import '../../models/payment_request.dart';
import '../../models/payment_response.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUser();
  Future<ChangePasswordResponse> changePassword(String newPassword);
  Future<AddressesModel> addAddress({AddressRequest? request});
  Future<PaymentResponse> pay({PaymentRequest? request});
}
