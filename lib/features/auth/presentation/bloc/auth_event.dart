part of 'auth_bloc.dart';

abstract class AuthEvent {}

class OnLoginEvent extends AuthEvent {
  String email;
  String password;
  OnLoginEvent(this.email, this.password);
}

class OnRegisterEvent extends AuthEvent {
  RegisterRequestModel registerRequestModel;
  OnRegisterEvent(this.registerRequestModel);
}
