import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/cart/domain/usecases/apply_coupon_use_case.dart';
import 'package:ecommerce_shop/features/cart/domain/usecases/delete_cart_use_case.dart';
import 'package:ecommerce_shop/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/cart_model.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

@injectable
class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  GetCartUseCase getCartUseCase;
  DeleteCartUseCase deleteCartUseCase;
  ApplyCouponUseCase applyCouponUseCase;
  MyCartBloc(
      this.getCartUseCase, this.deleteCartUseCase, this.applyCouponUseCase)
      : super(MyCartInitial()) {
    on<LoadItems>(_onLoadItems);
    on<DeleteItem>(_onDeleteItem);
    on<ApplyCoupon>(_onApplyCoupon);
  }

  Future<void> _onLoadItems(LoadItems event, Emitter<MyCartState> emit) async {
    emit(ItemsLoading());
    var result = await getCartUseCase.call();
    result.fold((error) {
      emit(ItemsError(failures: error));
    }, (model) {
      emit(ItemsLoaded(
          items: model.cart!.items,
          totalPrice: model.cart!.totalPrice,
          discount: 0));
    });
  }

  Future<void> _onDeleteItem(
      DeleteItem event, Emitter<MyCartState> emit) async {
    if (state is ItemsLoaded) {
      final currentState = state as ItemsLoaded;
      List<CartItem> updatedCartItems = _deleteItem(state, event, currentState);
      emit(
        ItemsLoaded(
            items: updatedCartItems,
            totalPrice: _totalPriceAfterDelete(
                currentState.totalPrice, currentState.items[event.index]),
            discount: 0),
      );
      var result = await deleteCartUseCase.call(event.id);
      result.fold((error) {
        emit(ItemsError(failures: error));
      }, (model) {});
    }
  }

  Future<void> _onApplyCoupon(
      ApplyCoupon event, Emitter<MyCartState> emit) async {
    if (state is ItemsLoaded) {
      final currentState = state as ItemsLoaded;

      var result = await applyCouponUseCase.call(event.code);
      result.fold((error) {
        emit(ItemsError(failures: error));
      }, (model) {
        if (currentState.totalPrice > 500) {
          num priceAfterDiscount =
              currentState.totalPrice - model.cart!.discount!;
          emit(ItemsLoaded(
              items: currentState.items,
              totalPrice: priceAfterDiscount,
              discount: model.cart!.discount!));
        } else {
          emit(
              ApplyCouponError(error: "Total price must be greater than 1500"));
        }
      });
    }
  }

  num _totalPriceAfterDelete(num totalPrice, CartItem item) {
    num totalPriceAfterDelete = totalPrice - item.product!.priceAfterDiscount!;
    return totalPriceAfterDelete;
  }

  List<CartItem> _deleteItem(
      MyCartState state, DeleteItem event, ItemsLoaded currentState) {
    final updatedItems = List.of(currentState.items)..removeAt(event.index);
    return updatedItems;
  }
}
