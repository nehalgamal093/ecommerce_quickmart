class DeleteWishlistResponse {
  String? message;
  List<String>? resultList;

  DeleteWishlistResponse({this.message, this.resultList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    map["result"] = resultList;
    return map;
  }

  DeleteWishlistResponse.fromJson(dynamic json) {
    message = json["message"];
    resultList = json["result"] != null ? json["result"].cast<String>() : [];
  }
}
