

class ReviewRequestModel {
  ReviewRequestModel({
      String? comment, 
      String? product, 
      num? ratings,}){
    _comment = comment;
    _product = product;
    _ratings = ratings;
}

  ReviewRequestModel.fromJson(dynamic json) {
    _comment = json['comment'];
    _product = json['product'];
    _ratings = json['ratings'];
  }
  String? _comment;
  String? _product;
  num? _ratings;
ReviewRequestModel copyWith({  String? comment,
  String? product,
  num? ratings,
}) => ReviewRequestModel(  comment: comment ?? _comment,
  product: product ?? _product,
  ratings: ratings ?? _ratings,
);
  String? get comment => _comment;
  String? get product => _product;
  num? get ratings => _ratings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment'] = _comment;
    map['product'] = _product;
    map['ratings'] = _ratings;
    return map;
  }

}