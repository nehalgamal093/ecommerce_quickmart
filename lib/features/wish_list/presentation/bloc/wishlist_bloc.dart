import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failures.dart';
import '../../domain/usecases/wishlist_use_case.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

@injectable
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistUseCase wishlistUseCase;
  WishlistBloc(this.wishlistUseCase) : super(WishlistInitial()) {
    on<GetWishlistEvent>((event, emit) async {
      emit(
        state.copyWith(wishlistRequestState: WishlistRequestState.loading),
      );
      var result = await wishlistUseCase.call();
      result.fold((error) {
        emit(
          state.copyWith(
              wishlistRequestState: WishlistRequestState.error,
              failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              wishlistRequestState: WishlistRequestState.success,
              wishlistModel: model),
        );
      });
    });
  }
}
