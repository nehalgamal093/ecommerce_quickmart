class CartItems {
  String? product;
  num? quantity;
  num? price;
  String? id;

  CartItems({this.product, this.quantity, this.price, this.id});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["product"] = product;
    map["quantity"] = quantity;
    map["price"] = price;
    map["_id"] = id;
    return map;
  }

  CartItems.fromJson(dynamic json) {
    product = json["product"];
    quantity = json["quantity"];
    price = json["price"];
    id = json["_id"];
  }
}

class Result {
  String? id;
  String? user;
  List<CartItems>? cartItemsList;
  num? totalPrice;
  String? createdAt;
  String? updatedAt;
  num? v;

  Result(
      {this.id,
      this.user,
      this.cartItemsList,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["user"] = user;
    if (cartItemsList != null) {
      map["cartItems"] = cartItemsList?.map((v) => v.toJson()).toList();
    }
    map["totalPrice"] = totalPrice;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  Result.fromJson(dynamic json) {
    id = json["_id"];
    user = json["user"];
    if (json["cartItems"] != null) {
      cartItemsList = [];
      json["cartItems"].forEach((v) {
        cartItemsList?.add(CartItems.fromJson(v));
      });
    }
    totalPrice = json["totalPrice"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class DeleteCartResponse {
  String? message;
  Result? result;

  DeleteCartResponse({this.message, this.result});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (result != null) {
      map["result"] = result?.toJson();
    }
    return map;
  }

  DeleteCartResponse.fromJson(dynamic json) {
    message = json["message"];
    result = json["result"] != null ? Result.fromJson(json["result"]) : null;
  }
}
