part of 'products_bloc.dart';

abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {
  final String subCategoryId;
  GetProductsEvent({required this.subCategoryId});
}
class IsProductLikedEvent extends ProductsEvent{
  final bool isLiked;
  final String id;
  IsProductLikedEvent({required this.id,this.isLiked=false});
}
class AddToWishlistEvent extends ProductsEvent {
  final String productId;
  AddToWishlistEvent({required this.productId});
}

class DeleteFromWishlistEvent extends ProductsEvent {
  final String productId;
  DeleteFromWishlistEvent({required this.productId});
}