part of 'profile_bloc.dart';

enum UserRequestState { initial, loading, success, error }

class ProfileState {
  UserRequestState? userRequestState;
  UserModel? userModel;
  AppFailures? failures;
  ProfileState({
    this.userRequestState,
    this.userModel,
    this.failures,
  });
  ProfileState copyWith({
    UserRequestState? userRequestState,
    UserModel? userModel,
    AppFailures? failures,
  }) {
    return ProfileState(
      userRequestState: userRequestState ?? this.userRequestState,
      userModel: userModel ?? this.userModel,
      failures: failures ?? this.failures,
    );
  }
}

class ProfileInitial extends ProfileState {
  ProfileInitial() : super(userRequestState: UserRequestState.initial);
}
