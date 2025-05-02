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

class Cart {
  String? user;
  List<CartItems>? cartItemsList;
  String? id;
  num? totalPrice;
  String? createdAt;
  String? updatedAt;
  num? v;

  Cart(
      {this.user,
      this.cartItemsList,
      this.id,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["user"] = user;
    if (cartItemsList != null) {
      map["cartItems"] = cartItemsList?.map((v) => v.toJson()).toList();
    }
    map["_id"] = id;
    map["totalPrice"] = totalPrice;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  Cart.fromJson(dynamic json) {
    user = json["user"];
    if (json["cartItems"] != null) {
      cartItemsList = [];
      json["cartItems"].forEach((v) {
        cartItemsList?.add(CartItems.fromJson(v));
      });
    }
    id = json["_id"];
    totalPrice = json["totalPrice"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class AddCartResponse {
  String? message;
  Cart? cart;

  AddCartResponse({this.message, this.cart});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (cart != null) {
      map["cart"] = cart?.toJson();
    }
    return map;
  }

  AddCartResponse.fromJson(dynamic json) {
    message = json["message"];
    cart = json["cart"] != null ? Cart.fromJson(json["cart"]) : null;
  }
}
