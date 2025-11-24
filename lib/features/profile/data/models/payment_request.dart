import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../auth/presentation/screen/import_files/import_files.dart';

class Items {
  String? name;
  num? amount;
  String? description;
  num? quantity;

  Items({this.name, this.amount, this.description, this.quantity});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = name;
    map["amount"] = amount;
    map["description"] = description;
    map["quantity"] = quantity;
    return map;
  }

  Items.fromJson(dynamic json) {
    name = json["name"];
    amount = json["amount"];
    description = json["description"];
    quantity = json["quantity"];
  }
}

class BillingData {
  String? apartment;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? phoneNumber;
  String? city;
  String? country;
  String? email;
  String? floor;
  String? state;

  BillingData(
      {this.apartment,
      this.firstName,
      this.lastName,
      this.street,
      this.building,
      this.phoneNumber,
      this.city,
      this.country,
      this.email,
      this.floor,
      this.state});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["apartment"] = apartment;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    map["street"] = street;
    map["building"] = building;
    map["phone_number"] = phoneNumber;
    map["city"] = city;
    map["country"] = country;
    map["email"] = email;
    map["floor"] = floor;
    map["state"] = state;
    return map;
  }

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName() {
    lastName = "Negal";
  }

  void setStreet(String street) {
    this.street = street;
  }

  void setCountry() {
    country = "Canada";
  }

  void setState(String state) {
    this.state = state;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setCity(String city) {
    this.city = city;
  }

  void setApartment() {
    apartment = StringsManager.na;
  }

  void setEmail() {
    email = "nehal@gmail.com";
  }

  void setBuilding() {
    building = StringsManager.na;
  }

  void setFloor() {
    floor = StringsManager.na;
  }

  void typeOtherValues() {
    setEmail();
    setCountry();
    setLastName();
    setFloor();
    setBuilding();
    setApartment();
  }

  BillingData.fromJson(dynamic json) {
    apartment = json["apartment"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    street = json["street"];
    building = json["building"];
    phoneNumber = json["phone_number"];
    city = json["city"];
    country = json["country"];
    email = json["email"];
    floor = json["floor"];
    state = json["state"];
  }
}

class Extras {
  num? ee;

  Extras({this.ee});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["ee"] = ee;
    return map;
  }

  Extras.fromJson(dynamic json) {
    ee = json["ee"];
  }
}

class PaymentRequest {
  num? amount;
  String? currency;
  List<num>? paymentMethodsList;
  List<Items>? itemsList;
  BillingData? billingData;
  Extras? extras;
  String? specialReference;
  num? expiration;
  String? notificationUrl;
  String? redirectionUrl;

  PaymentRequest(
      {this.amount,
      this.currency,
      this.paymentMethodsList,
      this.itemsList,
      this.billingData,
      this.extras,
      this.specialReference,
      this.expiration,
      this.notificationUrl,
      this.redirectionUrl});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["amount"] = amount;
    map["currency"] = currency;
    map["payment_methods"] = paymentMethodsList;
    if (itemsList != null) {
      map["items"] = itemsList?.map((v) => v.toJson()).toList();
    }
    if (billingData != null) {
      map["billing_data"] = billingData?.toJson();
    }
    if (extras != null) {
      map["extras"] = extras?.toJson();
    }
    map["special_reference"] = specialReference;
    map["expiration"] = expiration;
    map["notification_url"] = notificationUrl;
    map["redirection_url"] = redirectionUrl;
    return map;
  }

  PaymentRequest.fromJson(dynamic json) {
    amount = json["amount"];
    currency = json["currency"];
    paymentMethodsList = json["payment_methods"] != null
        ? json["payment_methods"].cast<num>()
        : [];
    if (json["items"] != null) {
      itemsList = [];
      json["items"].forEach((v) {
        itemsList?.add(Items.fromJson(v));
      });
    }
    billingData = json["billing_data"] != null
        ? BillingData.fromJson(json["billing_data"])
        : null;
    extras = json["extras"] != null ? Extras.fromJson(json["extras"]) : null;
    specialReference = json["special_reference"];
    expiration = json["expiration"];
    notificationUrl = json["notification_url"];
    redirectionUrl = json["redirection_url"];
  }

  void setAmount(num amount) {
    this.amount = amount;
  }

  void setItems(List<Items>? itemsList) {
    this.itemsList = itemsList;
  }

  void setBillingData(BillingData billingData) {
    this.billingData = billingData;
  }

  void setCurrency() {
    currency = StringsManager.egp;
  }

  void setPaymentMethodsList() {
    paymentMethodsList = [5048616];
  }

  void setExtras() {
    extras = Extras(ee: 100);
  }

  void setSpecialReference() {
    specialReference = UniqueKey().hashCode.toString();
  }

  void setExpiration() {
    expiration = 3600;
  }

  void setNotificationUr() {
    notificationUrl = dotenv.env['NOTIFICATION_URL']!;
  }

  void setRedirectionUrl() {
    redirectionUrl = dotenv.env['REDIRECTION_URL']!;
  }

  void setValues(BillingData billingData, List<Items>? itemsList, num amount) {
    setAmount(amount);
    setItems(itemsList);
    setBillingData(billingData);
    setCurrency();
    setPaymentMethodsList();
    setExtras();
    setSpecialReference();
    setExpiration();
    setNotificationUr();
    setRedirectionUrl();
  }
}
