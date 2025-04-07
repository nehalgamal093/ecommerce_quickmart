class Result {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? role;
  bool? isActive;
  bool? verified;
  List<String>? wishlistList;
  List<dynamic>? addressesList;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? passwordChangedAt;

  Result(
      {this.id, this.name, this.email, this.password, this.phone, this.role, this.isActive, this.verified, this.wishlistList, this.addressesList, this.createdAt, this.updatedAt, this.v, this.passwordChangedAt});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["phone"] = phone;
    map["role"] = role;
    map["isActive"] = isActive;
    map["verified"] = verified;
    map["wishlist"] = wishlistList;
    if (addressesList != null) {
      map["addresses"] = addressesList?.map((v) => v.toJson()).toList();
    }
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    map["passwordChangedAt"] = passwordChangedAt;
    return map;
  }

  Result.fromJson(dynamic json){
    id = json["_id"];
    name = json["name"];
    email = json["email"];
    password = json["password"];
    phone = json["phone"];
    role = json["role"];
    isActive = json["isActive"];
    verified = json["verified"];
    wishlistList =
    json["wishlist"] != null ? json["wishlist"].cast<String>() : [];
    if (json["addresses"] != null) {
      addressesList = [];
    }
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    passwordChangedAt = json["passwordChangedAt"];
  }
}

class UserModel {
  String? message;
  Result? result;

  UserModel({this.message, this.result});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (result != null) {
      map["result"] = result?.toJson();
    }
    return map;
  }

  UserModel.fromJson(dynamic json){
    message = json["message"];
    result = json["result"] != null ? Result.fromJson(json["result"]) : null;
  }
}