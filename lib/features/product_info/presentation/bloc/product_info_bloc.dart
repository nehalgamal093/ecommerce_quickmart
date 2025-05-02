import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/product_info/data/model/product_details_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_response.dart';
import 'package:ecommerce_shop/features/product_info/domain/usecases/product_details_use_case.dart';
import 'package:ecommerce_shop/features/product_info/domain/usecases/reviews_use_case.dart';
import 'package:ecommerce_shop/features/product_info/domain/usecases/write_review_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';

part 'product_info_event.dart';
part 'product_info_state.dart';

@injectable
class ProductInfoBloc extends Bloc<ProductInfoEvent, ProductsInfoState> {
  ReviewsUseCase reviewsUseCase;
  WriteReviewUseCase writeReviewUseCase;
  ProductDetailsUseCase productDetailsUseCase;

  ProductInfoBloc(
      this.reviewsUseCase, this.writeReviewUseCase, this.productDetailsUseCase)
      : super(ProductsInfoInitial()) {
    on<GetReviewsEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
              productsInfoRequestState: ProductsInfoRequestState.loading),
        );
        var result = await reviewsUseCase.call(event.id);
        result.fold((error) {
          emit(
            state.copyWith(
                productsInfoRequestState: ProductsInfoRequestState.error,
                failures: error),
          );
        }, (model) {
          emit(
            state.copyWith(
                productsInfoRequestState: ProductsInfoRequestState.success,
                reviews: model),
          );
        });
      },
    );
    on<WriteReviewEvent>((event, emit) async {
      emit(
        state.copyWith(
            writingReviewRequestState: ProductsInfoRequestState.loading),
      );
      var result = await writeReviewUseCase.call(request: event.requestModel);

      result.fold((error) {
        emit(
          state.copyWith(
              writingReviewRequestState: ProductsInfoRequestState.error,
              failures: error),
        );
      }, (model) {
        add(GetReviewsEvent(event.requestModel.product!));
        emit(
          state.copyWith(
              writingReviewRequestState: ProductsInfoRequestState.success,
              reviewResponse: model),
        );
      });
    });
    on<GetProductInfoEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
              productDetailsRequestState: ProductsInfoRequestState.loading),
        );
        var result = await productDetailsUseCase.call(event.id);
        result.fold((error) {
          emit(
            state.copyWith(
                productDetailsRequestState: ProductsInfoRequestState.error,
                failures: error),
          );
        }, (model) {
          emit(
            state.copyWith(
                productDetailsRequestState: ProductsInfoRequestState.success,
                productDetailsModel: model),
          );
        });
      },
    );
  }
}
