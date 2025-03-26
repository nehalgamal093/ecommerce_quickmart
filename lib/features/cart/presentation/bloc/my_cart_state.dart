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
  final List<CartItem>items;
  const ItemsLoaded({required this.items});
  @override
  List<Object> get props => [items];
}

class ItemsError extends MyCartState {
  final AppFailures failures;
  const ItemsError({required this.failures});
  @override
  List<Object> get props => [failures];
}