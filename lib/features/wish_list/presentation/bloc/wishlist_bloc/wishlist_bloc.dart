import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/wish_list/data/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/logic/failures/failures.dart';
import '../../../domain/usecases/delete_from_wishlist_usecase.dart';
import '../../../domain/usecases/wishlist_use_case.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

@injectable
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistUseCase wishlistUseCase;
  DeleteFromWishlistUseCase deleteFromWishlistUseCase;
  WishlistBloc(this.wishlistUseCase, this.deleteFromWishlistUseCase)
      : super(WishlistInitial()) {
    on<LoadItems>(_onLoadItems);
    on<DeleteItem>(_onDeleteItem);
  }

  Future<void> _onLoadItems(
      LoadItems event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    var result = await wishlistUseCase.call();
    result.fold((error) {
      emit(WishlistError(failures: error));
    }, (model) {
      emit(WishlistLoaded(
        list: model.resultList!,
      ));
    });
  }

  Future<void> _onDeleteItem(
      DeleteItem event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      List<Result> updatedWishlistItems =
          _deleteItem(state, event, currentState);
      emit(
        WishlistLoaded(
          list: updatedWishlistItems,
        ),
      );
      var result = await deleteFromWishlistUseCase.call(event.id);
      result.fold((error) {
        emit(WishlistError(failures: error));
      }, (model) {});
    }
  }

  List<Result> _deleteItem(
      WishlistState state, DeleteItem event, WishlistLoaded currentState) {
    final updatedItems = List.of(currentState.list!)..removeAt(event.index);
    return updatedItems;
  }
}
