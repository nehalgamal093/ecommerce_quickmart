part of 'profile_bloc.dart';

enum UserRequestState { initial, loading, success, error }

enum ChangePasswordState { initial, loading, success, error }

class ProfileState {
  UserRequestState? userRequestState;
  UserRequestState? addAddressRequest;
  AddressesModel? addressesModel;
  UserModel? userModel;
  ChangePasswordState? changePasswordState;
  ChangePasswordResponse? changePasswordResponse;
  AppFailures? failures;
  ProfileState(
      {this.userRequestState,
      this.userModel,
      this.failures,
      this.changePasswordState,
      this.changePasswordResponse,
      this.addAddressRequest,
      this.addressesModel});
  ProfileState copyWith({
    UserRequestState? userRequestState,
    UserModel? userModel,
    AppFailures? failures,
    ChangePasswordState? changePasswordState,
    ChangePasswordResponse? changePasswordResponse,
    UserRequestState? addAddressRequest,
    AddressesModel? addressesModel,
  }) {
    return ProfileState(
        userRequestState: userRequestState ?? this.userRequestState,
        userModel: userModel ?? this.userModel,
        failures: failures ?? this.failures,
        changePasswordState: changePasswordState ?? this.changePasswordState,
        changePasswordResponse:
            changePasswordResponse ?? this.changePasswordResponse,
        addAddressRequest: addAddressRequest ?? this.addAddressRequest,
        addressesModel: addressesModel ?? this.addressesModel);
  }
}

class ProfileInitial extends ProfileState {
  ProfileInitial() : super(userRequestState: UserRequestState.initial);
}
