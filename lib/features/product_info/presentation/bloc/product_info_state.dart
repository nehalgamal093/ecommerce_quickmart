part of 'product_info_bloc.dart';

enum ProductsInfoRequestState { initial, loading, success, error }

class ProductsInfoState {
  ProductsInfoRequestState? productsInfoRequestState;
  ProductsInfoRequestState? writingReviewRequestState;
  ProductsInfoRequestState? productDetailsRequestState;
  ProductsInfoRequestState? addToCartRequestState;
  AddCartResponse? addCartResponse;
  Review? reviews;
  ProductDetailsModel? productDetailsModel;
  ReviewResponse? reviewResponse;
  AppFailures? failures;

  ProductsInfoState(
      {this.productsInfoRequestState,
      this.reviews,
      this.failures,
      this.writingReviewRequestState,
      this.reviewResponse,
      this.productDetailsRequestState,
      this.productDetailsModel,
      this.addToCartRequestState,
      this.addCartResponse});

  ProductsInfoState copyWith(
      {ProductsInfoRequestState? productsInfoRequestState,
      ProductsInfoRequestState? writingReviewRequestState,
      ReviewResponse? reviewResponse,
      ProductsInfoRequestState? productDetailsRequestState,
      ProductDetailsModel? productDetailsModel,
      Review? reviews,
      AppFailures? failures,
      ProductsInfoRequestState? addToCartRequestState,
      AddCartResponse? addCartResponse}) {
    return ProductsInfoState(
        productsInfoRequestState:
            productsInfoRequestState ?? this.productsInfoRequestState,
        reviewResponse: reviewResponse ?? this.reviewResponse,
        writingReviewRequestState:
            writingReviewRequestState ?? this.writingReviewRequestState,
        reviews: reviews ?? this.reviews,
        failures: failures ?? this.failures,
        addToCartRequestState:
            addToCartRequestState ?? this.addToCartRequestState,
        addCartResponse: addCartResponse ?? this.addCartResponse,
        productDetailsRequestState:
            productDetailsRequestState ?? this.productDetailsRequestState,
        productDetailsModel: productDetailsModel ?? this.productDetailsModel);
  }
}

final class ProductsInfoInitial extends ProductsInfoState {
  ProductsInfoInitial()
      : super(
          productsInfoRequestState: ProductsInfoRequestState.initial,
        );
}
