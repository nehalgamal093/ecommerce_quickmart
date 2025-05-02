class Categories {
  Categories({
    String? message,
    num? page,
    List<Result>? result,
  }) {
    _message = message;
    _page = page;
    _result = result;
  }

  Categories.fromJson(dynamic json) {
    _message = json['message'];
    _page = json['page'];
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }
  String? _message;
  num? _page;
  List<Result>? _result;
  Categories copyWith({
    String? message,
    num? page,
    List<Result>? result,
  }) =>
      Categories(
        message: message ?? _message,
        page: page ?? _page,
        result: result ?? _result,
      );
  String? get message => _message;
  num? get page => _page;
  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['page'] = _page;
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Result {
  Result({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? cloudinaryId,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _cloudinaryId = cloudinaryId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Result.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _cloudinaryId = json['cloudinary_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _image;
  String? _cloudinaryId;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Result copyWith({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? cloudinaryId,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Result(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        image: image ?? _image,
        cloudinaryId: cloudinaryId ?? _cloudinaryId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get image => _image;
  String? get cloudinaryId => _cloudinaryId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    map['cloudinary_id'] = _cloudinaryId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
