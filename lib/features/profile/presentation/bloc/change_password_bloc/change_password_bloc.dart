import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/logic/failures/failures.dart';
import '../../../data/models/change_password_response.dart';
import '../../../domain/usecases/change_password_usecase.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordUseCase changePasswordUseCase;
  ChangePasswordBloc(this.changePasswordUseCase)
      : super(ChangePasswordInitial()) {
    on<PasswordChangeEvent>((event, emit) async {
      emit(
        state.copyWith(changePasswordState: RequestState.loading),
      );
      var result = await changePasswordUseCase.call(event.newPassword);
      result.fold((error) {
        emit(
          state.copyWith(
              changePasswordState: RequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              changePasswordState: RequestState.success,
              changePasswordResponse: model),
        );
      });
    });
  }
}
