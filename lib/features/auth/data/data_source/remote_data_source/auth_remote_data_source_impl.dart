import 'package:dio/dio.dart';
import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/core/resources/constants/endpoints.dart';
import 'package:ecommerce_shop/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';
import 'package:injectable/injectable.dart';

import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  APIManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);
  @override
  Future<AuthModel> login(String email, String password) async {
    var response = await apiManager
        .postRequest(EndPoints.login, {"email": email, "password": password});
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        String errorMessage = "Login failed";
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
  Future<AuthModel> register({RegisterRequestModel? request}) async {
    var response =
        await apiManager.postRequest(EndPoints.register, request!.toJson());
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        String errorMessage = "Register failed";
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

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
