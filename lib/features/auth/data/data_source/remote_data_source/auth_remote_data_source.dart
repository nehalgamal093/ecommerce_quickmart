import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';

import '../../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> register({RegisterRequestModel? request});
}
