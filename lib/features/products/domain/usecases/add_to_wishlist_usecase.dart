import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/products/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/add_wish_list_response.dart';

@injectable
class AddToWishlistUseCase {
  ProductsRepo productsRepo;
  AddToWishlistUseCase(this.productsRepo);

  Future<Either<AppFailures, AddWishListResponse>> call(String productId) =>
      productsRepo.addToWishlist(productId);
}
