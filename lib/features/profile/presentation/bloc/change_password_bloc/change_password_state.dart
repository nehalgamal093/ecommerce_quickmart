part of 'change_password_bloc.dart';

enum RequestState { initial, loading, success, error }

class ChangePasswordState {
  RequestState? changePasswordState;
  ChangePasswordResponse? changePasswordResponse;
  AppFailures? failures;
  ChangePasswordState({
    this.failures,
    this.changePasswordState,
    this.changePasswordResponse,
  });
  ChangePasswordState copyWith({
    AppFailures? failures,
    RequestState? changePasswordState,
    ChangePasswordResponse? changePasswordResponse,
  }) {
    return ChangePasswordState(
      failures: failures ?? this.failures,
      changePasswordState: changePasswordState ?? this.changePasswordState,
      changePasswordResponse:
          changePasswordResponse ?? this.changePasswordResponse,
    );
  }
}

class ChangePasswordInitial extends ChangePasswordState {
  ChangePasswordInitial() : super(changePasswordState: RequestState.initial);
}
