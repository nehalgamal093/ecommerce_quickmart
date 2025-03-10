import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/core/failures/failures.dart';
import 'package:ecommerce_shop/features/auth/data/models/auth_model.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';
import 'package:ecommerce_shop/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_shop/features/auth/domain/usecases/register_usecase.dart';
import 'package:injectable/injectable.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  AuthBloc(this.loginUseCase, this.registerUseCase) : super(AuthInitial()) {
    on<OnLoginEvent>((event, emit) async {
      emit(
        state.copyWith(loginRequestState: RequestState.loading),
      );
      var result = await loginUseCase.call(event.email, event.password);
      result.fold((error) {
        emit(
          state.copyWith(
              loginRequestState: RequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              loginRequestState: RequestState.success, authModel: model),
        );
      });
    });

    on<OnRegisterEvent>((event, emit) async {
      emit(
        state.copyWith(registerRequestState: RequestState.loading),
      );
      var result =
          await registerUseCase.call(request: event.registerRequestModel);
      result.fold((error) {
        emit(
          state.copyWith(
              registerRequestState: RequestState.error, failures: error),
        );
      }, (model) {
        emit(
          state.copyWith(
              registerRequestState: RequestState.success, authModel: model),
        );
      });
    });
  }
}
