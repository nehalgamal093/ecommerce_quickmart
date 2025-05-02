part of 'address_bloc.dart';

enum AddressRequestState { initial, loading, success, error }

class AddressState {
  AddressRequestState? addAddressRequest;
  AddressesModel? addressesModel;
  AppFailures? failures;
  AddressState({this.failures, this.addAddressRequest, this.addressesModel});
  AddressState copyWith({
    AddressRequestState? addAddressRequest,
    AppFailures? failures,
    AddressesModel? addressesModel,
  }) {
    return AddressState(
        addAddressRequest: addAddressRequest ?? this.addAddressRequest,
        failures: failures ?? this.failures,
        addressesModel: addressesModel ?? this.addressesModel);
  }
}

final class AddressInitial extends AddressState {
  AddressInitial() : super(addAddressRequest: AddressRequestState.initial);
}
