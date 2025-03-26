part of 'my_cart_bloc.dart';

abstract class MyCartEvent extends Equatable {
  const MyCartEvent();
  @override
  List<Object> get props => [];
}

class LoadItems extends MyCartEvent {}
class DeleteItem extends MyCartEvent {
  final int index;
final String id;
  const DeleteItem(this.index,this.id);

  @override
  List<Object> get props => [index,id];
}
