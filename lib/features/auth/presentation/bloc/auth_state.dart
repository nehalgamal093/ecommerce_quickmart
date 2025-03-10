part of 'auth_bloc.dart';

enum RequestState { initial, loading, success, error }

class AuthState {
  RequestState? loginRequestState;
  RequestState? registerRequestState;
  AuthModel? authModel;
  AppFailures? failures;

  AuthState(
      {this.loginRequestState,
      this.authModel,
      this.failures,
      this.registerRequestState});

  AuthState copyWith(
      {RequestState? loginRequestState,
      RequestState? registerRequestState,
      AuthModel? authModel,
      AppFailures? failures}) {
    return AuthState(
        loginRequestState: loginRequestState ?? this.loginRequestState,
        registerRequestState: registerRequestState ?? this.registerRequestState,
        authModel: authModel ?? this.authModel,
        failures: failures ?? this.failures);
  }
}

final class AuthInitial extends AuthState {
  AuthInitial()
      : super(
            loginRequestState: RequestState.initial,
            registerRequestState: RequestState.initial);
}
