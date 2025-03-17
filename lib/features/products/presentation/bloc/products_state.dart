part of 'products_bloc.dart';

enum ProductsRequestState { initial, loading, success, error }

class ProductsState {
  ProductsRequestState? productsRequestState;
  Products? products;
  AppFailures? failures;

  ProductsState(
      {this.productsRequestState, this.products, this.failures});

  ProductsState copyWith(
      {ProductsRequestState? productsRequestState,
        Products? products,
        AppFailures? failures}) {
    return ProductsState(
        productsRequestState:
        productsRequestState ?? this.productsRequestState,
        products: products ?? this.products,
        failures: failures ?? this.failures);
  }
}

final class ProductsInitial extends ProductsState {
  ProductsInitial()
      : super(
    productsRequestState: ProductsRequestState.initial,
  );
}
