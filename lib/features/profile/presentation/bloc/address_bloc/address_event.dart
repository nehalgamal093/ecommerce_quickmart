part of 'address_bloc.dart';

abstract class AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final AddressRequest request;
  AddAddressEvent(this.request);
}
