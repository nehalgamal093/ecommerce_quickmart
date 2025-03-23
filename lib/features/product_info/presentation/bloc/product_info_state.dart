part of 'product_info_bloc.dart';

enum ProductsInfoRequestState { initial, loading, success, error }

class ProductsInfoState {
  ProductsInfoRequestState? productsInfoRequestState;
  ProductsInfoRequestState? writingReviewRequestState;
  ProductsInfoRequestState? productDetailsRequestState;
  Review? reviews;
  ProductDetailsModel? productDetailsModel;
  ReviewResponse? reviewResponse;
  AppFailures? failures;

  ProductsInfoState({this.productsInfoRequestState, this.reviews, this.failures,this.writingReviewRequestState,this.reviewResponse,this.productDetailsRequestState,this.productDetailsModel});

  ProductsInfoState copyWith(
      {ProductsInfoRequestState? productsInfoRequestState,
        ProductsInfoRequestState? writingReviewRequestState,
        ReviewResponse? reviewResponse,
        ProductsInfoRequestState? productDetailsRequestState,
        ProductDetailsModel? productDetailsModel,
      Review? reviews,
      AppFailures? failures}) {
    return ProductsInfoState(
        productsInfoRequestState:
        productsInfoRequestState ?? this.productsInfoRequestState,
        reviewResponse: reviewResponse??this.reviewResponse,
        writingReviewRequestState: writingReviewRequestState??this.writingReviewRequestState,
        reviews: reviews ?? this.reviews,
        failures: failures ?? this.failures,

    productDetailsRequestState: productDetailsRequestState??this.productDetailsRequestState,
    productDetailsModel: productDetailsModel??this.productDetailsModel);
  }
}

final class ProductsInfoInitial extends ProductsInfoState {
  ProductsInfoInitial()
      : super(
          productsInfoRequestState: ProductsInfoRequestState.initial,
        );
}
