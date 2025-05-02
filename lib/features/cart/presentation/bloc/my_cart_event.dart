part of 'my_cart_bloc.dart';

abstract class MyCartEvent extends Equatable {
  const MyCartEvent();
  @override
  List<Object> get props => [];
}

class LoadCartItems extends MyCartEvent {}

class DeleteItem extends MyCartEvent {
  final int index;
  final String id;
  const DeleteItem(this.index, this.id);

  @override
  List<Object> get props => [index, id];
}

class ApplyCoupon extends MyCartEvent {
  final String code;
  const ApplyCoupon(this.code);

  @override
  List<Object> get props => [code];
}

class AddToCartEvent extends MyCartEvent {
  final String id;
  const AddToCartEvent(this.id);
}
