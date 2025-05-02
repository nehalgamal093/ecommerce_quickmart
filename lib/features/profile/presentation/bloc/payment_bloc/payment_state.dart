part of 'payment_bloc.dart';

enum PaymentRequestState { initial, loading, success, error }

class PaymentState {
  PaymentRequestState? paymentRequestState;
  PaymentResponse? paymentResponse;
  AppFailures? failures;
  PaymentState({
    this.paymentRequestState,
    this.paymentResponse,
    this.failures,
  });
  PaymentState copyWith({
    PaymentRequestState? paymentRequestState,
    PaymentResponse? paymentResponse,
    AppFailures? failures,
  }) {
    return PaymentState(
      paymentRequestState: paymentRequestState ?? this.paymentRequestState,
      paymentResponse: paymentResponse ?? this.paymentResponse,
      failures: failures ?? this.failures,
    );
  }
}

final class PaymentInitial extends PaymentState {
  PaymentInitial() : super(paymentRequestState: PaymentRequestState.initial);
}
