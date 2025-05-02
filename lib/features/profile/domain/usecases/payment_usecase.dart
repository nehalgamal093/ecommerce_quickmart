import 'package:dartz/dartz.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_response.dart';
import 'package:ecommerce_shop/features/profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentUseCase {
  ProfileRepo profileRepo;
  PaymentUseCase(this.profileRepo);

  Future<Either<AppFailures, PaymentResponse>> call(
          {PaymentRequest? request}) =>
      profileRepo.pay(request: request);
}
