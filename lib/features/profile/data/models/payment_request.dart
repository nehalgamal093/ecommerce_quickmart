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

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

  void setStreet(String street) {
    this.street = street;
  }

  void setCountry(String country) {
    this.country = country;
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

  void setApartment(String apartment) {
    this.apartment = apartment;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setBuilding(String building) {
    this.building = building;
  }

  void setFloor(String floor) {
    this.floor = floor;
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
}
