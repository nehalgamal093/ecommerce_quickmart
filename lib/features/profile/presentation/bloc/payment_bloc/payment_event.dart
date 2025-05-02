part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class ProcessPaymentEvent extends PaymentEvent {
  final PaymentRequest request;
  ProcessPaymentEvent(this.request);
}
