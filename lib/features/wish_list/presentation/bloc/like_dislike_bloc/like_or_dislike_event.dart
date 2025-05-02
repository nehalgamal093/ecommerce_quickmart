part of 'like_or_dislike_bloc.dart';

abstract class LikeOrDislikeEvent {}

class IsProductLikedEvent extends LikeOrDislikeEvent {
  final String id;
  IsProductLikedEvent({required this.id});
}

class AddToWishlistEvent extends LikeOrDislikeEvent {
  final String productId;
  AddToWishlistEvent({required this.productId});
}

class DeleteFromWishlistEvent extends LikeOrDislikeEvent {
  final String productId;
  DeleteFromWishlistEvent({required this.productId});
}
