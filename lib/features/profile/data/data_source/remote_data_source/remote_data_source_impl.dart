import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/caching/cache_helper.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/core/resources/constants/constants.dart';
import 'package:ecommerce_shop/features/profile/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce_shop/features/profile/data/models/address_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/addresses_model.dart';
import 'package:ecommerce_shop/features/profile/data/models/change_password_response.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/constants/endpoints.dart';
import '../../../../auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import '../../models/user_model.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  APIManager apiManager;
  ProfileRemoteDataSourceImpl(this.apiManager);
  @override
  Future<UserModel> getUser() async {
    var response =
        await apiManager.getRequest(EndPoints.user(CacheHelper.getUserId()!));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        String errorMessage = "User failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['errors'][0]['msg'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<ChangePasswordResponse> changePassword(String newPassword) async {
    var response = await apiManager.patchRequest(
        EndPoints.changePassword(CacheHelper.getUserId()!),
        {"password": newPassword});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ChangePasswordResponse.fromJson(response.data);
      } else {
        String errorMessage = "Change Password failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['errors'][0]['msg'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<AddressesModel> addAddress({AddressRequest? request}) async {
    var response = await apiManager.patchRequest(
        EndPoints.addresses, request!.toJson(),
        headers: {"token": CacheHelper.getToken()});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AddressesModel.fromJson(response.data);
      } else {
        String errorMessage = "Add Address failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['errors'][0]['msg'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<PaymentResponse> pay({PaymentRequest? request}) async {
    var response = await apiManager.postRequest(
        EndPoints.paymentRequest, request!.toJson(),
        headers: {"Authorization": AppConstants.payMobToken});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return PaymentResponse.fromJson(response.data);
      } else {
        String errorMessage = "Payment failed";
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['errors'][0]['msg'] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }
}
