part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
  @override
  List<Object> get props => [];
}

final class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<Result> list;

  const WishlistLoaded({required this.list});
  @override
  List<Object> get props => [list];
}

class WishlistError extends WishlistState {
  final AppFailures failures;
  const WishlistError({required this.failures});
  @override
  List<Object> get props => [failures];
}
