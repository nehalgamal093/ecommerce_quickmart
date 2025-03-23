
class ProductDetailsModel {
  ProductDetailsModel({
      String? message, 
      Result? result,}){
    _message = message;
    _result = result;
}

  ProductDetailsModel.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? _message;
  Result? _result;
  ProductDetailsModel copyWith({  String? message,
  Result? result,
}) => ProductDetailsModel(  message: message ?? _message,
  result: result ?? _result,
);
  String? get message => _message;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }

}


class Result {
  Result({
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
      List<MyReviews>? myReviews, 
      }){
    _id = id;
    _title = title;
    _slug = slug;
    _price = price;
    _priceAfterDiscount = priceAfterDiscount;
    _ratingAvg = ratingAvg;
    _ratingCount = ratingCount;
    _description = description;
    _quantity = quantity;
    _sold = sold;
    _images = images;
    _category = category;
    _subCategory = subCategory;
    _brand = brand;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _myReviews = myReviews;

}

  Result.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _slug = json['slug'];
    _price = json['price'];
    _priceAfterDiscount = json['priceAfterDiscount'];
    _ratingAvg = json['ratingAvg'];
    _ratingCount = json['ratingCount'];
    _description = json['description'];
    _quantity = json['quantity'];
    _sold = json['sold'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _category = json['category'];
    _subCategory = json['subCategory'];
    _brand = json['brand'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    if (json['myReviews'] != null) {
      _myReviews = [];
      json['myReviews'].forEach((v) {
        _myReviews?.add(MyReviews.fromJson(v));
      });
    }

  }
  String? _id;
  String? _title;
  String? _slug;
  num? _price;
  num? _priceAfterDiscount;
  num? _ratingAvg;
  num? _ratingCount;
  String? _description;
  num? _quantity;
  num? _sold;
  List<Images>? _images;
  String? _category;
  String? _subCategory;
  String? _brand;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  List<MyReviews>? _myReviews;

Result copyWith({  String? id,
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
  List<MyReviews>? myReviews,

}) => Result(  id: id ?? _id,
  title: title ?? _title,
  slug: slug ?? _slug,
  price: price ?? _price,
  priceAfterDiscount: priceAfterDiscount ?? _priceAfterDiscount,
  ratingAvg: ratingAvg ?? _ratingAvg,
  ratingCount: ratingCount ?? _ratingCount,
  description: description ?? _description,
  quantity: quantity ?? _quantity,
  sold: sold ?? _sold,
  images: images ?? _images,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
  brand: brand ?? _brand,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  myReviews: myReviews ?? _myReviews,

);
  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  num? get price => _price;
  num? get priceAfterDiscount => _priceAfterDiscount;
  num? get ratingAvg => _ratingAvg;
  num? get ratingCount => _ratingCount;
  String? get description => _description;
  num? get quantity => _quantity;
  num? get sold => _sold;
  List<Images>? get images => _images;
  String? get category => _category;
  String? get subCategory => _subCategory;
  String? get brand => _brand;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  List<MyReviews>? get myReviews => _myReviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['price'] = _price;
    map['priceAfterDiscount'] = _priceAfterDiscount;
    map['ratingAvg'] = _ratingAvg;
    map['ratingCount'] = _ratingCount;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['sold'] = _sold;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['category'] = _category;
    map['subCategory'] = _subCategory;
    map['brand'] = _brand;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    if (_myReviews != null) {
      map['myReviews'] = _myReviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



class MyReviews {
  MyReviews({
      String? id, 
      String? comment, 
      String? product, 
      User? user, 
      num? ratings, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _comment = comment;
    _product = product;
    _user = user;
    _ratings = ratings;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  MyReviews.fromJson(dynamic json) {
    _id = json['_id'];
    _comment = json['comment'];
    _product = json['product'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _ratings = json['ratings'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _comment;
  String? _product;
  User? _user;
  num? _ratings;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
MyReviews copyWith({  String? id,
  String? comment,
  String? product,
  User? user,
  num? ratings,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => MyReviews(  id: id ?? _id,
  comment: comment ?? _comment,
  product: product ?? _product,
  user: user ?? _user,
  ratings: ratings ?? _ratings,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get comment => _comment;
  String? get product => _product;
  User? get user => _user;
  num? get ratings => _ratings;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['comment'] = _comment;
    map['product'] = _product;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['ratings'] = _ratings;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}


class User {
  User({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
User copyWith({  String? id,
  String? name,
}) => User(  id: id ?? _id,
  name: name ?? _name,
);
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }

}



class Images {
  Images({
      String? attachmentFile, 
      String? cloudinaryId, 
      String? id, 
   }){
    _attachmentFile = attachmentFile;
    _cloudinaryId = cloudinaryId;
    _id = id;

}

  Images.fromJson(dynamic json) {
    _attachmentFile = json['attachment_file'];
    _cloudinaryId = json['cloudinary_id'];
    _id = json['_id'];

  }
  String? _attachmentFile;
  String? _cloudinaryId;
  String? _id;

Images copyWith({  String? attachmentFile,
  String? cloudinaryId,
  String? id,

}) => Images(  attachmentFile: attachmentFile ?? _attachmentFile,
  cloudinaryId: cloudinaryId ?? _cloudinaryId,
  id: id ?? _id,

);
  String? get attachmentFile => _attachmentFile;
  String? get cloudinaryId => _cloudinaryId;
  String? get id => _id;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attachment_file'] = _attachmentFile;
    map['cloudinary_id'] = _cloudinaryId;
    map['_id'] = _id;
    return map;
  }

}