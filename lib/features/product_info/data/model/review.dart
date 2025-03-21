
class Review {
  Review({
      String? message, 
      num? page, 
      List<Result>? result,}){
    _message = message;
    _page = page;
    _result = result;
}

  Review.fromJson(dynamic json) {
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
Review copyWith({  String? message,
  num? page,
  List<Result>? result,
}) => Review(  message: message ?? _message,
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

  Result.fromJson(dynamic json) {
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
Result copyWith({  String? id,
  String? comment,
  String? product,
  User? user,
  num? ratings,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Result(  id: id ?? _id,
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