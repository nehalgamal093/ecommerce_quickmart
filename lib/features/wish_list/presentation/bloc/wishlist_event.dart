part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
  @override
  List<Object> get props => [];
}

class LoadItems extends WishlistEvent {}

class DeleteItem extends WishlistEvent {
  final int index;
  final String id;
  const DeleteItem(this.index, this.id);

  @override
  List<Object> get props => [index, id];
}
