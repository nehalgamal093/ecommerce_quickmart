import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/products/data/models/add_wish_list_response.dart';
import 'package:ecommerce_shop/features/products/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ecommerce_shop/features/products/domain/usecases/delete_from_wishlist_usecase.dart';
import 'package:ecommerce_shop/features/products/domain/usecases/products_use_case.dart';
import 'package:ecommerce_shop/features/products/domain/usecases/wish_list_products_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failures/failures.dart';
import '../../data/models/delete_wishlist_response.dart';
import '../../data/models/products.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsUseCase productsUseCase;
  AddToWishlistUseCase addToWishlistUseCase;
  DeleteFromWishlistUseCase deleteFromWishlistUseCase;
  WishListProductsUseCaseUseCase wishListProductsUseCaseUseCase;
  ProductsBloc(this.productsUseCase, this.addToWishlistUseCase,
      this.wishListProductsUseCaseUseCase, this.deleteFromWishlistUseCase)
      : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(
        state.copyWith(productsRequestState: ProductsRequestState.loading),
      );
      var result = await productsUseCase.call(event.subCategoryId);
      result.fold((error) {
        emit(
          state.copyWith(
              productsRequestState: ProductsRequestState.error,
              failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              productsRequestState: ProductsRequestState.success,
              products: model),
        );
      });
    });
    on<IsProductLikedEvent>((event, emit) async {
      var result = await wishListProductsUseCaseUseCase.call();
      result.fold((error) {
        emit(
          state.copyWith(
              likeOrDisLikeState: LikeOrDisLikeState.disliked, failures: error),
        );
      }, (model) {
        List<String> ids = model.resultList!.map((e) => e.id!).toList();

        if (ids.contains(event.id)) {
          emit(
            state.copyWith(
              likeOrDisLikeState: LikeOrDisLikeState.liked,
            ),
          );
        } else {
          emit(
            state.copyWith(
              likeOrDisLikeState: LikeOrDisLikeState.disliked,
            ),
          );
        }
      });
    });
    on<AddToWishlistEvent>((event, emit) async {
      emit(
        state.copyWith(
          likeOrDisLikeState: LikeOrDisLikeState.liked,
        ),
      );

      var result = await addToWishlistUseCase.call(event.productId);
      result.fold((error) {
        emit(
          state.copyWith(
              addToWishlistState: ProductsRequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
            addToWishlistState: ProductsRequestState.success,
          ),
        );
      });
    });
    on<DeleteFromWishlistEvent>((event, emit) async {
      emit(state.copyWith(
        likeOrDisLikeState: LikeOrDisLikeState.disliked,
      ));
      var result = await deleteFromWishlistUseCase.call(event.productId);
      result.fold((error) {
        emit(
          state.copyWith(
              deleteFromWishlistState: ProductsRequestState.error,
              failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
            deleteFromWishlistState: ProductsRequestState.success,
          ),
        );
      });
    });
  }
}
