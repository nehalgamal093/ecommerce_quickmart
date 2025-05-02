import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/cart/data/models/add_cart_response.dart';
import 'package:ecommerce_shop/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';

@injectable
class AddCartUseCase {
  CartRepo cartRepo;
  AddCartUseCase(this.cartRepo);

  Future<Either<AppFailures, AddCartResponse>> call(String productId) =>
      cartRepo.addToCart(productId);
}
