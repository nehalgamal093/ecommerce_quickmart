import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/add_to_wishlist_usecase.dart';
import '../../../domain/usecases/delete_from_wishlist_usecase.dart';
import '../../../domain/usecases/wishlist_use_case.dart';

part 'like_or_dislike_event.dart';
part 'like_or_dislike_state.dart';

@injectable
class LikeOrDislikeBloc extends Bloc<LikeOrDislikeEvent, LikeOrDislikeState> {
  WishlistUseCase wishlistUseCase;
  AddToWishlistUseCase addToWishlistUseCase;
  DeleteFromWishlistUseCase deleteFromWishlistUseCase;

  LikeOrDislikeBloc(this.wishlistUseCase, this.deleteFromWishlistUseCase,
      this.addToWishlistUseCase)
      : super(LikeOrDislikeInitial()) {
    on<IsProductLikedEvent>(_isProductLiked);
    on<AddToWishlistEvent>(_onAddToWishlist);
    on<DeleteFromWishlistEvent>(_deleteProductWishlist);
  }

  Future<void> _isProductLiked(
      IsProductLikedEvent event, Emitter<LikeOrDislikeState> emit) async {
    emit(
      DislikeState(),
    );
    var result = await wishlistUseCase.call();
    result.fold((error) {
      emit(
        DislikeState(),
      );
    }, (model) {
      List<String> ids = model.resultList!.map((e) => e.id!).toList();

      if (ids.contains(event.id)) {
        emit(LikedState());
      } else {
        emit(DislikeState());
      }
    });
  }

  Future<void> _onAddToWishlist(
      AddToWishlistEvent event, Emitter<LikeOrDislikeState> emit) async {
    emit(
      LikedState(),
    );

    var result = await addToWishlistUseCase.call(event.productId);
    result.fold((error) {
      emit(DislikeState());
    }, (model) {
      emit(LikedState());
    });
  }

  Future<void> _deleteProductWishlist(
      DeleteFromWishlistEvent event, Emitter<LikeOrDislikeState> emit) async {
    emit(DislikeState());
    var result = await deleteFromWishlistUseCase.call(event.productId);
    result.fold((error) {
      emit(LikedState());
    }, (model) {
      emit(DislikeState());
    });
  }
}
