part of 'wishlist_bloc.dart';

enum WishlistRequestState { initial, loading, success, error }

class WishlistState {
  WishlistRequestState? wishlistRequestState;
  WishlistModel? wishlistModel;
  AppFailures? failures;

  WishlistState(
      {this.wishlistRequestState, this.wishlistModel, this.failures});

  WishlistState copyWith(
      {WishlistRequestState? wishlistRequestState,
      WishlistModel? wishlistModel,
      AppFailures? failures}) {
    return WishlistState(
        wishlistRequestState: wishlistRequestState ?? this.wishlistRequestState,
        wishlistModel: wishlistModel ?? this.wishlistModel,
        failures: failures ?? this.failures);
  }
}

final class WishlistInitial extends WishlistState {
  WishlistInitial()
      : super(
          wishlistRequestState: WishlistRequestState.initial,
        );
}
