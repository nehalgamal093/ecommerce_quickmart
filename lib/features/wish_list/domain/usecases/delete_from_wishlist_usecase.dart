import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/delete_wishlist_response.dart';
import '../repository/wish_list_repo.dart';

@injectable
class DeleteFromWishlistUseCase {
  WishlistRepo wishlistRepo;
  DeleteFromWishlistUseCase(this.wishlistRepo);

  Future<Either<AppFailures, DeleteWishlistResponse>> call(String productId) =>
      wishlistRepo.deleteFromWishlist(productId);
}
