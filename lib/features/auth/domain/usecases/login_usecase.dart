import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_shop/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {

  AuthRepo authRepo;
  LoginUseCase(this.authRepo);

  Future<Either<AppFailures, AuthModel>> call(String email, String password) =>
      authRepo.login(email, password);
}
