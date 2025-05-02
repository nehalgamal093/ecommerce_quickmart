class Products {
  Products({
    num? pages,
    String? message,
    num? page,
    num? pagePerCategory,
    List<Result>? result,
  }) {
    _pages = pages;
    _message = message;
    _page = page;
    _pagePerCategory = pagePerCategory;
    _result = result;
  }

  Products.fromJson(dynamic json) {
    _pages = json['pages'];
    _message = json['message'];
    _page = json['page'];
    _pagePerCategory = json['pagePerCategory'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  num? _pages;
  String? _message;
  num? _page;
  num? _pagePerCategory;
  List<Result>? _result;
  Products copyWith({
    num? pages,
    String? message,
    num? page,
    num? pagePerCategory,
    List<Result>? result,
  }) =>
      Products(
        pages: pages ?? _pages,
        message: message ?? _message,
        page: page ?? _page,
        pagePerCategory: pagePerCategory ?? _pagePerCategory,
        result: result ?? _result,
      );
  num? get pages => _pages;
  String? get message => _message;
  num? get page => _page;
  num? get pagePerCategory => _pagePerCategory;
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pages'] = _pages;
    map['message'] = _message;
    map['page'] = _page;
    map['pagePerCategory'] = _pagePerCategory;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
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
    List<String>? myReviews,
  }) {
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
    _myReviews =
        json['myReviews'] != null ? json['myReviews'].cast<String>() : [];
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
  List<String>? _myReviews;
  Result copyWith({
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
    List<String>? myReviews,
  }) =>
      Result(
        id: id ?? _id,
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
  List<String>? get myReviews => _myReviews;

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
    map['myReviews'] = _myReviews;
    return map;
  }
}

class Images {
  Images({
    String? attachmentFile,
    String? cloudinaryId,
    String? id,
  }) {
    _attachmentFile = attachmentFile;
    _cloudinaryId = cloudinaryId;
    _id = id;
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

  Images copyWith({
    String? attachmentFile,
    String? cloudinaryId,
    String? id,
  }) =>
      Images(
        attachmentFile: attachmentFile ?? _attachmentFile,
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
