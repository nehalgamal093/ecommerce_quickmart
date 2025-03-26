import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_shop/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failures.dart';

@injectable
class GetCartUseCase {
  CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);

  Future<Either<AppFailures, CartModel>> call() =>
      cartRepo.getCart();
}
