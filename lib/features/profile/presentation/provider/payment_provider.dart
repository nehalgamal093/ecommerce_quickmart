import 'package:ecommerce_shop/features/profile/data/models/payment_request.dart';
import 'package:flutter/cupertino.dart';

class PaymentProvider extends ChangeNotifier {
  BillingData billingData = BillingData();
  PaymentRequest paymentRequest = PaymentRequest();

  void setBillingData(BillingData billingData) {
    this.billingData = billingData;
    notifyListeners();
  }

  void setPaymentRequest(PaymentRequest paymentRequest) {
    this.paymentRequest = paymentRequest;
    notifyListeners();
  }
}
