part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetUserEvent extends ProfileEvent {}

class ChangePasswordEvent extends ProfileEvent {
  final String newPassword;
  ChangePasswordEvent(this.newPassword);
}

class AddAddressEvent extends ProfileEvent {
  final AddressRequest request;
  AddAddressEvent(this.request);
}
