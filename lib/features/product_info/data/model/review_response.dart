class ReviewResponse {
  ReviewResponse({
    String? message,
    Result? result,
  }) {
    _message = message;
    _result = result;
  }

  ReviewResponse.fromJson(dynamic json) {
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? _message;
  Result? _result;
  ReviewResponse copyWith({
    String? message,
    Result? result,
  }) =>
      ReviewResponse(
        message: message ?? _message,
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
    String? comment,
    String? product,
    String? user,
    num? ratings,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _comment = comment;
    _product = product;
    _user = user;
    _ratings = ratings;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Result.fromJson(dynamic json) {
    _comment = json['comment'];
    _product = json['product'];
    _user = json['user'];
    _ratings = json['ratings'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _comment;
  String? _product;
  String? _user;
  num? _ratings;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Result copyWith({
    String? comment,
    String? product,
    String? user,
    num? ratings,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Result(
        comment: comment ?? _comment,
        product: product ?? _product,
        user: user ?? _user,
        ratings: ratings ?? _ratings,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get comment => _comment;
  String? get product => _product;
  String? get user => _user;
  num? get ratings => _ratings;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment'] = _comment;
    map['product'] = _product;
    map['user'] = _user;
    map['ratings'] = _ratings;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
