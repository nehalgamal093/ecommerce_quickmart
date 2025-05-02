class PaymentKeys {
  num? integration;
  String? key;
  String? gatewayType;
  dynamic iframeId;
  num? orderId;
  String? redirectionUrl;
  bool? saveCard;

  PaymentKeys(
      {this.integration,
      this.key,
      this.gatewayType,
      this.iframeId,
      this.orderId,
      this.redirectionUrl,
      this.saveCard});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["integration"] = integration;
    map["key"] = key;
    map["gateway_type"] = gatewayType;
    map["iframe_id"] = iframeId;
    map["order_id"] = orderId;
    map["redirection_url"] = redirectionUrl;
    map["save_card"] = saveCard;
    return map;
  }

  PaymentKeys.fromJson(dynamic json) {
    integration = json["integration"];
    key = json["key"];
    gatewayType = json["gateway_type"];
    iframeId = json["iframe_id"];
    orderId = json["order_id"];
    redirectionUrl = json["redirection_url"];
    saveCard = json["save_card"];
  }
}

class Items {
  String? name;
  num? amount;
  String? description;
  num? quantity;
  dynamic image;

  Items({this.name, this.amount, this.description, this.quantity, this.image});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = name;
    map["amount"] = amount;
    map["description"] = description;
    map["quantity"] = quantity;
    map["image"] = image;
    return map;
  }

  Items.fromJson(dynamic json) {
    name = json["name"];
    amount = json["amount"];
    description = json["description"];
    quantity = json["quantity"];
    image = json["image"];
  }
}

class BillingData {
  String? apartment;
  String? floor;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? phoneNumber;
  String? shippingMethod;
  String? city;
  String? country;
  String? state;
  String? email;
  String? postalCode;

  BillingData(
      {this.apartment,
      this.floor,
      this.firstName,
      this.lastName,
      this.street,
      this.building,
      this.phoneNumber,
      this.shippingMethod,
      this.city,
      this.country,
      this.state,
      this.email,
      this.postalCode});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["apartment"] = apartment;
    map["floor"] = floor;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    map["street"] = street;
    map["building"] = building;
    map["phone_number"] = phoneNumber;
    map["shipping_method"] = shippingMethod;
    map["city"] = city;
    map["country"] = country;
    map["state"] = state;
    map["email"] = email;
    map["postal_code"] = postalCode;
    return map;
  }

  BillingData.fromJson(dynamic json) {
    apartment = json["apartment"];
    floor = json["floor"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    street = json["street"];
    building = json["building"];
    phoneNumber = json["phone_number"];
    shippingMethod = json["shipping_method"];
    city = json["city"];
    country = json["country"];
    state = json["state"];
    email = json["email"];
    postalCode = json["postal_code"];
  }
}

class IntentionDetail {
  num? amount;
  List<Items>? itemsList;
  String? currency;
  BillingData? billingData;

  IntentionDetail(
      {this.amount, this.itemsList, this.currency, this.billingData});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["amount"] = amount;
    if (itemsList != null) {
      map["items"] = itemsList?.map((v) => v.toJson()).toList();
    }
    map["currency"] = currency;
    if (billingData != null) {
      map["billing_data"] = billingData?.toJson();
    }
    return map;
  }

  IntentionDetail.fromJson(dynamic json) {
    amount = json["amount"];
    if (json["items"] != null) {
      itemsList = [];
      json["items"].forEach((v) {
        itemsList?.add(Items.fromJson(v));
      });
    }
    currency = json["currency"];
    billingData = json["billing_data"] != null
        ? BillingData.fromJson(json["billing_data"])
        : null;
  }
}

class PaymentMethods {
  num? integrationId;
  dynamic alias;
  dynamic name;
  String? methodType;
  String? currency;
  bool? live;
  bool? useCvcWithMoto;

  PaymentMethods(
      {this.integrationId,
      this.alias,
      this.name,
      this.methodType,
      this.currency,
      this.live,
      this.useCvcWithMoto});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["integration_id"] = integrationId;
    map["alias"] = alias;
    map["name"] = name;
    map["method_type"] = methodType;
    map["currency"] = currency;
    map["live"] = live;
    map["use_cvc_with_moto"] = useCvcWithMoto;
    return map;
  }

  PaymentMethods.fromJson(dynamic json) {
    integrationId = json["integration_id"];
    alias = json["alias"];
    name = json["name"];
    methodType = json["method_type"];
    currency = json["currency"];
    live = json["live"];
    useCvcWithMoto = json["use_cvc_with_moto"];
  }
}

class CreationExtras {
  num? ee;
  String? merchantOrderId;

  CreationExtras({this.ee, this.merchantOrderId});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["ee"] = ee;
    map["merchant_order_id"] = merchantOrderId;
    return map;
  }

  CreationExtras.fromJson(dynamic json) {
    ee = json["ee"];
    merchantOrderId = json["merchant_order_id"];
  }
}

class Extras {
  CreationExtras? creationExtras;
  dynamic confirmationExtras;

  Extras({this.creationExtras, this.confirmationExtras});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (creationExtras != null) {
      map["creation_extras"] = creationExtras?.toJson();
    }
    map["confirmation_extras"] = confirmationExtras;
    return map;
  }

  Extras.fromJson(dynamic json) {
    creationExtras = json["creation_extras"] != null
        ? CreationExtras.fromJson(json["creation_extras"])
        : null;
    confirmationExtras = json["confirmation_extras"];
  }
}

class PaymentResponse {
  List<PaymentKeys>? paymentKeysList;
  String? redirectionUrl;
  num? intentionOrderId;
  String? id;
  IntentionDetail? intentionDetail;
  String? clientSecret;
  List<PaymentMethods>? paymentMethodsList;
  String? specialReference;
  Extras? extras;
  bool? confirmed;
  String? status;
  String? created;
  dynamic cardDetail;
  List<dynamic>? cardTokensList;
  String? object;

  PaymentResponse(
      {this.paymentKeysList,
      this.redirectionUrl,
      this.intentionOrderId,
      this.id,
      this.intentionDetail,
      this.clientSecret,
      this.paymentMethodsList,
      this.specialReference,
      this.extras,
      this.confirmed,
      this.status,
      this.created,
      this.cardDetail,
      this.cardTokensList,
      this.object});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (paymentKeysList != null) {
      map["payment_keys"] = paymentKeysList?.map((v) => v.toJson()).toList();
    }
    map["redirection_url"] = redirectionUrl;
    map["intention_order_id"] = intentionOrderId;
    map["id"] = id;
    if (intentionDetail != null) {
      map["intention_detail"] = intentionDetail?.toJson();
    }
    map["client_secret"] = clientSecret;
    if (paymentMethodsList != null) {
      map["payment_methods"] =
          paymentMethodsList?.map((v) => v.toJson()).toList();
    }
    map["special_reference"] = specialReference;
    if (extras != null) {
      map["extras"] = extras?.toJson();
    }
    map["confirmed"] = confirmed;
    map["status"] = status;
    map["created"] = created;
    map["card_detail"] = cardDetail;
    if (cardTokensList != null) {
      map["card_tokens"] = cardTokensList?.map((v) => v.toJson()).toList();
    }
    map["object"] = object;
    return map;
  }

  PaymentResponse.fromJson(dynamic json) {
    if (json["payment_keys"] != null) {
      paymentKeysList = [];
      json["payment_keys"].forEach((v) {
        paymentKeysList?.add(PaymentKeys.fromJson(v));
      });
    }
    redirectionUrl = json["redirection_url"];
    intentionOrderId = json["intention_order_id"];
    id = json["id"];
    intentionDetail = json["intention_detail"] != null
        ? IntentionDetail.fromJson(json["intention_detail"])
        : null;
    clientSecret = json["client_secret"];
    if (json["payment_methods"] != null) {
      paymentMethodsList = [];
      json["payment_methods"].forEach((v) {
        paymentMethodsList?.add(PaymentMethods.fromJson(v));
      });
    }
    specialReference = json["special_reference"];
    extras = json["extras"] != null ? Extras.fromJson(json["extras"]) : null;
    confirmed = json["confirmed"];
    status = json["status"];
    created = json["created"];
    cardDetail = json["card_detail"];
    if (json["card_tokens"] != null) {
      cardTokensList = [];
    }
    object = json["object"];
  }
}
