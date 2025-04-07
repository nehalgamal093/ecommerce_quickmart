import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failures.dart';
import '../../data/models/user_model.dart';

@injectable
class GetUserUseCase {
  ProfileRepo profileRepo;
  GetUserUseCase(this.profileRepo);
  Future<Either<AppFailures, UserModel>> call() =>
      profileRepo.getUser();
}
