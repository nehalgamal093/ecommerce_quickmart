import 'package:bloc/bloc.dart';
import '../../../../core/logic/failures/failures.dart';
import 'package:ecommerce_shop/features/cart/domain/usecases/apply_coupon_use_case.dart';
import 'package:ecommerce_shop/features/cart/domain/usecases/delete_cart_use_case.dart';
import 'package:ecommerce_shop/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/cart_model.dart';
import '../../domain/usecases/add_cart_use_case.dart';

part 'my_cart_event.dart';
part 'my_cart_state.dart';

@injectable
class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  GetCartUseCase getCartUseCase;
  DeleteCartUseCase deleteCartUseCase;
  ApplyCouponUseCase applyCouponUseCase;
  AddCartUseCase addCartUseCase;
  int discount = 0;
  MyCartBloc(this.getCartUseCase, this.deleteCartUseCase,
      this.applyCouponUseCase, this.addCartUseCase)
      : super(MyCartInitial()) {
    on<LoadCartItems>(_onLoadItems);
    on<DeleteItem>(_onDeleteItem);
    on<ApplyCoupon>(_onApplyCoupon);
    on<AddToCartEvent>(_onAddToCart);
  }

  Future<void> _onLoadItems(
      LoadCartItems event, Emitter<MyCartState> emit) async {
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

  Future<void> _onAddToCart(
      AddToCartEvent event, Emitter<MyCartState> emit) async {
    var result = await addCartUseCase.call(event.id);
    result.fold((error) {
      emit(ItemsError(failures: error));
    }, (model) {
      add(LoadCartItems());
    });
  }

  Future<void> _onApplyCoupon(
      ApplyCoupon event, Emitter<MyCartState> emit) async {
    if (state is ItemsLoaded) {
      final currentState = state as ItemsLoaded;
      var result = await applyCouponUseCase.call(event.code);
      result.fold((error) {
        emit(ItemsError(failures: error));
      }, (model) {
        num priceAfterDiscount =
            currentState.totalPrice - model.cart!.discount!;
        discount = model.cart!.discount!.toInt();
        emit(ItemsLoaded(
            items: currentState.items,
            totalPrice: priceAfterDiscount,
            discount: model.cart!.discount!));
      });
    }
  }

  num _totalPriceAfterDelete(num totalPrice, CartItem item) {
    num totalPriceAfterDelete = totalPrice - item.product!.price!+discount;
    return totalPriceAfterDelete;
  }

  List<CartItem> _deleteItem(
      MyCartState state, DeleteItem event, ItemsLoaded currentState) {
    final updatedItems = List.of(currentState.items)..removeAt(event.index);
    return updatedItems;
  }
}
