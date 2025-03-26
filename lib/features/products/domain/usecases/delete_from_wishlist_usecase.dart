import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/products/data/models/delete_wishlist_response.dart';
import 'package:ecommerce_shop/features/products/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromWishlistUseCase {
  ProductsRepo productsRepo;
  DeleteFromWishlistUseCase(this.productsRepo);

  Future<Either<AppFailures, DeleteWishlistResponse>> call(String productId) =>
      productsRepo.deleteFromWishlist(productId);
}
