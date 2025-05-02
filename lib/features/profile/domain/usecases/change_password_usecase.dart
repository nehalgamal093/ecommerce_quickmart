import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/change_password_response.dart';

@injectable
class ChangePasswordUseCase {
  ProfileRepo profileRepo;
  ChangePasswordUseCase(this.profileRepo);
  Future<Either<AppFailures, ChangePasswordResponse>> call(
          String newPassword) =>
      profileRepo.changePassword(newPassword);
}
