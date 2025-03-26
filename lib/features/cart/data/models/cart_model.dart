class Images {
  final String? attachmentFile;
  final String? cloudinaryId;
  final String? id;

  Images({this.attachmentFile, this.cloudinaryId, this.id});

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    attachmentFile: json["attachment_file"],
    cloudinaryId: json["cloudinary_id"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "attachment_file": attachmentFile,
    "cloudinary_id": cloudinaryId,
    "_id": id,
  };

  Images copyWith({
    String? attachmentFile,
    String? cloudinaryId,
    String? id,
  }) => Images(
    attachmentFile: attachmentFile ?? this.attachmentFile,
    cloudinaryId: cloudinaryId ?? this.cloudinaryId,
    id: id ?? this.id,
  );
}

class Product {
  final String? id;
  final String? title;
  final String? slug;
  final num? price;
  final num? priceAfterDiscount;
  final num? ratingAvg;
  final num? ratingCount;
  final String? description;
  final num? quantity;
  final num? sold;
  final List<Images>? images;
  final String? category;
  final String? subCategory;
  final String? brand;
  final String? createdAt;
  final String? updatedAt;
  final num? v;
  final List<dynamic>? myReviews;

  Product({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.priceAfterDiscount,
    this.ratingAvg,
    this.ratingCount,
    this.description,
    this.quantity,
    this.sold,
    this.images,
    this.category,
    this.subCategory,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.myReviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    title: json["title"],
    slug: json["slug"],
    price: json["price"],
    priceAfterDiscount: json["priceAfterDiscount"],
    ratingAvg: json["ratingAvg"],
    ratingCount: json["ratingCount"],
    description: json["description"],
    quantity: json["quantity"],
    sold: json["sold"],
    images: json["images"] == null
        ? null
        : List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    category: json["category"],
    subCategory: json["subCategory"],
    brand: json["brand"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    myReviews: json["myReviews"] == null
        ? null
        : List<dynamic>.from(json["myReviews"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "slug": slug,
    "price": price,
    "priceAfterDiscount": priceAfterDiscount,
    "ratingAvg": ratingAvg,
    "ratingCount": ratingCount,
    "description": description,
    "quantity": quantity,
    "sold": sold,
    "images": images == null
        ? null
        : List<dynamic>.from(images!.map((x) => x.toJson())),
    "category": category,
    "subCategory": subCategory,
    "brand": brand,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "myReviews": myReviews == null
        ? null
        : List<dynamic>.from(myReviews!.map((x) => x)),
  };

  Product copyWith({
    String? id,
    String? title,
    String? slug,
    num? price,
    num? priceAfterDiscount,
    num? ratingAvg,
    num? ratingCount,
    String? description,
    num? quantity,
    num? sold,
    List<Images>? images,
    String? category,
    String? subCategory,
    String? brand,
    String? createdAt,
    String? updatedAt,
    num? v,
    List<dynamic>? myReviews,
  }) => Product(
    id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    price: price ?? this.price,
    priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    ratingAvg: ratingAvg ?? this.ratingAvg,
    ratingCount: ratingCount ?? this.ratingCount,
    description: description ?? this.description,
    quantity: quantity ?? this.quantity,
    sold: sold ?? this.sold,
    images: images ?? this.images,
    category: category ?? this.category,
    subCategory: subCategory ?? this.subCategory,
    brand: brand ?? this.brand,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    myReviews: myReviews ?? this.myReviews,
  );
}

class CartItem {
  final Product? product;
  final num quantity;
  final num price;
  final String? id;

  CartItem({
    this.product,
    this.quantity = 1,
    this.price = 0,
    this.id,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    quantity: json["quantity"] ?? 1,
    price: json["price"] ?? 0,
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
    "price": price,
    "_id": id,
  };

  CartItem copyWith({
    Product? product,
    num? quantity,
    num? price,
    String? id,
  }) => CartItem(
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    id: id ?? this.id,
  );

  num get totalPrice => price * quantity;
}

class Cart {
  final String? id;
  final String? user;
  final List<CartItem> items;
  final num totalPrice;
  final String? createdAt;
  final String? updatedAt;
  final num? v;

  Cart({
    this.id,
    this.user,
    List<CartItem>? items,
    this.totalPrice = 0,
    this.createdAt,
    this.updatedAt,
    this.v,
  }) : items = items ?? [];

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["_id"],
    user: json["user"],
    items: json["cartItems"] == null
        ? []
        : List<CartItem>.from(json["cartItems"].map((x) => CartItem.fromJson(x))),
    totalPrice: json["totalPrice"] ?? 0,
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "cartItems": List<dynamic>.from(items.map((x) => x.toJson())),
    "totalPrice": totalPrice,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };

  Cart copyWith({
    String? id,
    String? user,
    List<CartItem>? items,
    num? totalPrice,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Cart(
    id: id ?? this.id,
    user: user ?? this.user,
    items: items ?? this.items,
    totalPrice: totalPrice ?? this.totalPrice,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
  );

  // Helper methods for cart operations
  Cart addItem(CartItem newItem) {
    final existingItemIndex = items.indexWhere((item) => item.product?.id == newItem.product?.id);

    if (existingItemIndex >= 0) {
      // Update quantity if item exists
      final updatedItems = List<CartItem>.from(items);
      updatedItems[existingItemIndex] = updatedItems[existingItemIndex].copyWith(
        quantity: updatedItems[existingItemIndex].quantity + newItem.quantity,
      );
      return copyWith(
        items: updatedItems,
        totalPrice: calculateTotalPrice(updatedItems),
      );
    } else {
      // Add new item
      final updatedItems = List<CartItem>.from(items)..add(newItem);
      return copyWith(
        items: updatedItems,
        totalPrice: calculateTotalPrice(updatedItems),
      );
    }
  }

  Cart removeItem(String itemId) {
    final updatedItems = items.where((item) => item.id != itemId).toList();
    return copyWith(
      items: updatedItems,
      totalPrice: calculateTotalPrice(updatedItems),
    );
  }

  Cart updateItemQuantity(String itemId, num newQuantity) {
    final updatedItems = items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(quantity: newQuantity);
      }
      return item;
    }).toList();

    return copyWith(
      items: updatedItems,
      totalPrice: calculateTotalPrice(updatedItems),
    );
  }

  num calculateTotalPrice(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity.toInt());
}

class CartModel {
  final String? message;
  final Cart? cart;

  CartModel({this.message, this.cart});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    message: json["message"],
    cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "cart": cart?.toJson(),
  };

  CartModel copyWith({
    String? message,
    Cart? cart,
  }) => CartModel(
    message: message ?? this.message,
    cart: cart ?? this.cart,
  );
}