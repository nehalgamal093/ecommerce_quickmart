import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/delete_cart_response.dart';

@injectable
class DeleteCartUseCase {
  CartRepo cartRepo;
  DeleteCartUseCase(this.cartRepo);

  Future<Either<AppFailures, DeleteCartResponse>> call(String id) =>
      cartRepo.deleteCart(id);
}
