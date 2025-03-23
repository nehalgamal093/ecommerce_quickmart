class AddWishListResponse {
  String? message;
  List<String>? resultList;

  AddWishListResponse({this.message, this.resultList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    map["result"] = resultList;
    return map;
  }

  AddWishListResponse.fromJson(dynamic json){
    message = json["message"];
    resultList = json["result"] != null ? json["result"].cast<String>() : [];
  }
}