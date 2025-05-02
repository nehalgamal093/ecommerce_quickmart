import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/add_wish_list_response.dart';
import '../repository/wish_list_repo.dart';

@injectable
class AddToWishlistUseCase {
  WishlistRepo wishlistRepo;
  AddToWishlistUseCase(this.wishlistRepo);

  Future<Either<AppFailures, AddWishListResponse>> call(String productId) =>
      wishlistRepo.addToWishlist(productId);
}
