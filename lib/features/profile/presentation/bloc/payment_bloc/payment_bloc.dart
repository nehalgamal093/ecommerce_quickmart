import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:ecommerce_shop/features/profile/data/models/payment_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/logic/failures/failures.dart';
import '../../../domain/usecases/payment_usecase.dart';

part 'payment_event.dart';
part 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentUseCase paymentUseCase;
  String clientSecret = "";
  PaymentBloc(this.paymentUseCase) : super(PaymentInitial()) {
    on<ProcessPaymentEvent>((event, emit) async {
      emit(
        state.copyWith(paymentRequestState: PaymentRequestState.loading),
      );
      var result = await paymentUseCase.call(request: event.request);
      result.fold((error) {
        emit(
          state.copyWith(
              paymentRequestState: PaymentRequestState.error, failures: error),
        );

      }, (model) {
        clientSecret = model.clientSecret!;
        emit(
          state.copyWith(
              paymentRequestState: PaymentRequestState.success,
              paymentResponse: model),
        );
      });
    });
  }
}
