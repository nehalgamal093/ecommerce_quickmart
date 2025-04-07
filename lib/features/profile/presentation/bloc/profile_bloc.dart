import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/profile/data/models/addresses_model.dart';
import 'package:ecommerce_shop/features/profile/data/models/user_model.dart';
import 'package:ecommerce_shop/features/profile/domain/usecases/add_address_usecase.dart';
import 'package:ecommerce_shop/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:ecommerce_shop/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/address_request.dart';
import '../../data/models/change_password_response.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetUserUseCase getUserUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  AddAddressUseCase addAddressUseCase;
  ProfileBloc(
      this.getUserUseCase, this.changePasswordUseCase, this.addAddressUseCase)
      : super(ProfileInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(
        state.copyWith(userRequestState: UserRequestState.loading),
      );
      var result = await getUserUseCase.call();
      result.fold((error) {
        emit(
          state.copyWith(
              userRequestState: UserRequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              userRequestState: UserRequestState.success, userModel: model),
        );
      });
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(
        state.copyWith(changePasswordState: ChangePasswordState.loading),
      );
      var result = await changePasswordUseCase.call(event.newPassword);
      result.fold((error) {
        emit(
          state.copyWith(
              changePasswordState: ChangePasswordState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              changePasswordState: ChangePasswordState.success,
              changePasswordResponse: model),
        );
      });
    });
    on<AddAddressEvent>((event, emit) async {
      emit(
        state.copyWith(addAddressRequest: UserRequestState.loading),
      );
      var result = await addAddressUseCase.call(request: event.request);
      result.fold((error) {
        emit(
          state.copyWith(
              addAddressRequest: UserRequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              addAddressRequest: UserRequestState.success,
              addressesModel: model),
        );
      });
    });
  }
}
