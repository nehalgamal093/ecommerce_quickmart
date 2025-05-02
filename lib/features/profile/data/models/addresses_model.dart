class Result {
  String? city;
  String? street;
  String? phone;
  String? id;

  Result({this.city, this.street, this.phone, this.id});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["city"] = city;
    map["street"] = street;
    map["phone"] = phone;
    map["_id"] = id;
    return map;
  }

  Result.fromJson(dynamic json) {
    city = json["city"];
    street = json["street"];
    phone = json["phone"];
    id = json["_id"];
  }
}

class AddressesModel {
  String? message;
  List<Result>? resultList;

  AddressesModel({this.message, this.resultList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (resultList != null) {
      map["result"] = resultList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  AddressesModel.fromJson(dynamic json) {
    message = json["message"];
    if (json["result"] != null) {
      resultList = [];
      json["result"].forEach((v) {
        resultList?.add(Result.fromJson(v));
      });
    }
  }
}
