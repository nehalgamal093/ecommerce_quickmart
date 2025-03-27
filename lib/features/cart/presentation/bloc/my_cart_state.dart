part of 'my_cart_bloc.dart';

abstract class MyCartState extends Equatable {
  const MyCartState();
  @override
  List<Object> get props => [];
}

final class MyCartInitial extends MyCartState {

}
class ItemsLoading extends MyCartState {}
 class ItemsLoaded extends MyCartState {
  final num totalPrice;
  final List<CartItem>items;
  final num discount ;
  const ItemsLoaded({required this.items,required this.totalPrice,required this.discount});
  @override
  List<Object> get props => [items,totalPrice,discount];
}

class ItemsError extends MyCartState {
  final AppFailures failures;
  const ItemsError({required this.failures});
  @override
  List<Object> get props => [failures];
}
