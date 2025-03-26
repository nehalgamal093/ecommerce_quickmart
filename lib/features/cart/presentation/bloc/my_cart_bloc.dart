import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/cart/data/models/delete_cart_response.dart';
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
  MyCartBloc(this.getCartUseCase,this.deleteCartUseCase) : super(MyCartInitial()) {
    on<LoadItems>(_onLoadItems);
    on<DeleteItem>(_onDeleteItem);
  }

  Future<void> _onLoadItems(LoadItems event, Emitter<MyCartState> emit) async {
    emit(ItemsLoading());
    var result = await getCartUseCase.call();
    result.fold((error) {
      emit(ItemsError(failures: error));
    },(model){
      emit(ItemsLoaded(items: model.cart!.items));
    });
  }

  Future<void> _onDeleteItem(DeleteItem event, Emitter<MyCartState> emit) async {
    if (state is ItemsLoaded) {
      print('>>> state ${state}');
      final currentState = state as ItemsLoaded;
      final updatedItems = List.of(currentState.items)..removeAt(event.index);
      print('${updatedItems.map((e)=>e.product!.title).toList()}');
      emit(ItemsLoaded(items: updatedItems));
      var result = await deleteCartUseCase.call(event.id);
      result.fold((error) {
print('error');
        emit(ItemsError(failures: error));
      }, (model) {
        print("Success");
        // emit(ItemsLoaded(items: updatedItems));
      });
    }
  }



}
