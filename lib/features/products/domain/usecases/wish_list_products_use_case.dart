import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/wish_list/domain/repository/wish_list_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failures.dart';
import '../../../wish_list/data/models/wishlist_model.dart';

@injectable
class WishListProductsUseCaseUseCase {
  WishlistRepo wishlistRepo;
  WishListProductsUseCaseUseCase(this.wishlistRepo);

  Future<Either<AppFailures, WishlistModel>> call() =>
      wishlistRepo.getWishlist();
}
