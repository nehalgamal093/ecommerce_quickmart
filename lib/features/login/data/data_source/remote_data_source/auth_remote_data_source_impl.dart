import 'package:ecommerce_shop/core/network/api_manager/api_manager.dart';
import 'package:ecommerce_shop/core/resources/endpoints.dart';
import 'package:ecommerce_shop/features/login/data/models/auth_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
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
          errorMessage = response.data['error'][0] ?? errorMessage;
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
