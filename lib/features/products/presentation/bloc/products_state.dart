part of 'products_bloc.dart';

enum ProductsRequestState { initial, loading, success, error }

enum LikeOrDisLikeState { disliked, liked }

class ProductsState {
  ProductsRequestState? productsRequestState;
  LikeOrDisLikeState? likeOrDisLikeState;
  ProductsRequestState? addToWishlistState;
  AddWishListResponse? addWishListResponse;
  DeleteWishlistResponse? deleteWishlistResponse;
  ProductsRequestState? deleteFromWishlistState;
  Products? products;
  AppFailures? failures;

  ProductsState(
      {this.deleteFromWishlistState,
      this.deleteWishlistResponse,
      this.productsRequestState,
      this.addToWishlistState,
      this.products,
      this.failures,
      this.likeOrDisLikeState,
      this.addWishListResponse});

  ProductsState copyWith(
      {ProductsRequestState? productsRequestState,
      Products? products,
      ProductsRequestState? deleteFromWishlistState,
      DeleteWishlistResponse? deleteWishlistResponse,
      AddWishListResponse? addWishListResponse,
      AppFailures? failures,
      ProductsRequestState? addToWishlistState,
      LikeOrDisLikeState? likeOrDisLikeState}) {
    return ProductsState(
      deleteFromWishlistState:
          deleteFromWishlistState ?? this.deleteFromWishlistState,
      addWishListResponse: addWishListResponse ?? this.addWishListResponse,
      deleteWishlistResponse:
          deleteWishlistResponse ?? this.deleteWishlistResponse,
      addToWishlistState: addToWishlistState ?? this.addToWishlistState,
      productsRequestState: productsRequestState ?? this.productsRequestState,
      products: products ?? this.products,
      failures: failures ?? this.failures,
      likeOrDisLikeState: likeOrDisLikeState ?? this.likeOrDisLikeState,
    );
  }
}

final class ProductsInitial extends ProductsState {
  ProductsInitial()
      : super(
          addToWishlistState: ProductsRequestState.initial,
          likeOrDisLikeState: LikeOrDisLikeState.disliked,
          productsRequestState: ProductsRequestState.initial,
        );
}
