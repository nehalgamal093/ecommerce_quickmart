import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/profile/data/models/user_model.dart';
import 'package:ecommerce_shop/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/logic/failures/failures.dart';
import '../../../data/models/address_request.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  GetUserUseCase getUserUseCase;

  ProfileBloc(this.getUserUseCase) : super(ProfileInitial()) {
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
  }
}
