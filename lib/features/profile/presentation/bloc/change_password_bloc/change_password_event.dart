part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent {}

class PasswordChangeEvent extends ChangePasswordEvent {
  final String newPassword;
  PasswordChangeEvent(this.newPassword);
}
