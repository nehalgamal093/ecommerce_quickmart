part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetUserEvent extends ProfileEvent {}

class AddAddressEvent extends ProfileEvent {
  final AddressRequest request;
  AddAddressEvent(this.request);
}
