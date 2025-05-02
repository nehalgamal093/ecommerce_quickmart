import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/apply_coupon_reponse.dart';

@injectable
class ApplyCouponUseCase {
  CartRepo cartRepo;
  ApplyCouponUseCase(this.cartRepo);
  Future<Either<AppFailures, ApplyCouponReponse>> call(String code) =>
      cartRepo.applyCoupon(code);
}
