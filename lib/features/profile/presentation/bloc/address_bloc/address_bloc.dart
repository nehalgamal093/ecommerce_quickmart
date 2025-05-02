import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/logic/failures/failures.dart';
import '../../../data/models/address_request.dart';
import '../../../data/models/addresses_model.dart';
import '../../../domain/usecases/add_address_usecase.dart';

part 'address_event.dart';
part 'address_state.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddAddressUseCase addAddressUseCase;
  AddressBloc(this.addAddressUseCase) : super(AddressInitial()) {
    on<AddAddressEvent>((event, emit) async {
      emit(
        state.copyWith(addAddressRequest: AddressRequestState.loading),
      );
      var result = await addAddressUseCase.call(request: event.request);
      result.fold((error) {
        emit(
          state.copyWith(
              addAddressRequest: AddressRequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              addAddressRequest: AddressRequestState.success,
              addressesModel: model),
        );
      });
    });
  }
}
