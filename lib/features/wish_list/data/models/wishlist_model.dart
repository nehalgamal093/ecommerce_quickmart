class Images {
  String? attachmentFile;
  String? cloudinaryId;
  String? id;

  Images({this.attachmentFile, this.cloudinaryId, this.id});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["attachment_file"] = attachmentFile;
    map["cloudinary_id"] = cloudinaryId;
    map["_id"] = id;

    return map;
  }

  Images.fromJson(dynamic json) {
    attachmentFile = json["attachment_file"];
    cloudinaryId = json["cloudinary_id"];
    id = json["_id"];
  }
}

class User {
  String? id;
  String? name;

  User({this.id, this.name});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    return map;
  }

  User.fromJson(dynamic json) {
    id = json["_id"];
    name = json["name"];
  }
}

class MyReviews {
  String? id;
  String? comment;
  String? product;
  User? user;
  num? ratings;
  String? createdAt;
  String? updatedAt;
  num? v;

  MyReviews(
      {this.id,
      this.comment,
      this.product,
      this.user,
      this.ratings,
      this.createdAt,
      this.updatedAt,
      this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["comment"] = comment;
    map["product"] = product;
    if (user != null) {
      map["user"] = user?.toJson();
    }
    map["ratings"] = ratings;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  MyReviews.fromJson(dynamic json) {
    id = json["_id"];
    comment = json["comment"];
    product = json["product"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
    ratings = json["ratings"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class Result {
  String? id;
  String? title;
  String? slug;
  num? price;
  num? priceAfterDiscount;
  num? ratingAvg;
  num? ratingCount;
  String? description;
  num? quantity;
  num? sold;
  List<Images>? imagesList;
  String? category;
  String? subCategory;
  String? brand;
  String? createdAt;
  String? updatedAt;
  num? v;
  List<MyReviews>? myReviewsList;

  Result(
      {this.id,
      this.title,
      this.slug,
      this.price,
      this.priceAfterDiscount,
      this.ratingAvg,
      this.ratingCount,
      this.description,
      this.quantity,
      this.sold,
      this.imagesList,
      this.category,
      this.subCategory,
      this.brand,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.myReviewsList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["title"] = title;
    map["slug"] = slug;
    map["price"] = price;
    map["priceAfterDiscount"] = priceAfterDiscount;
    map["ratingAvg"] = ratingAvg;
    map["ratingCount"] = ratingCount;
    map["description"] = description;
    map["quantity"] = quantity;
    map["sold"] = sold;
    if (imagesList != null) {
      map["images"] = imagesList?.map((v) => v.toJson()).toList();
    }
    map["category"] = category;
    map["subCategory"] = subCategory;
    map["brand"] = brand;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    if (myReviewsList != null) {
      map["myReviews"] = myReviewsList?.map((v) => v.toJson()).toList();
    }

    return map;
  }

  Result.fromJson(dynamic json) {
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    price = json["price"];
    priceAfterDiscount = json["priceAfterDiscount"];
    ratingAvg = json["ratingAvg"];
    ratingCount = json["ratingCount"];
    description = json["description"];
    quantity = json["quantity"];
    sold = json["sold"];
    if (json["images"] != null) {
      imagesList = [];
      json["images"].forEach((v) {
        imagesList?.add(Images.fromJson(v));
      });
    }
    category = json["category"];
    subCategory = json["subCategory"];
    brand = json["brand"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    if (json["myReviews"] != null) {
      myReviewsList = [];
      json["myReviews"].forEach((v) {
        myReviewsList?.add(MyReviews.fromJson(v));
      });
    }
  }
}

class WishlistModel {
  String? message;
  List<Result>? resultList;

  WishlistModel({this.message, this.resultList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (resultList != null) {
      map["result"] = resultList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  WishlistModel.fromJson(dynamic json) {
    message = json["message"];
    if (json["result"] != null) {
      resultList = [];
      json["result"].forEach((v) {
        resultList?.add(Result.fromJson(v));
      });
    }
  }
}
