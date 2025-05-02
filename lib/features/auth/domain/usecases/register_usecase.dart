import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';
import 'package:ecommerce_shop/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase(this.authRepo);

  Future<Either<AppFailures, AuthModel>> call(
          {RegisterRequestModel? request}) =>
      authRepo.register(request: request);
}
