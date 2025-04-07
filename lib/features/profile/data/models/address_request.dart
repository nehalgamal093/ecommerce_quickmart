class AddressRequest {
  String? street;
  String? city;
  String? phone;

  AddressRequest({this.street, this.city, this.phone});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["street"] = street;
    map["city"] = city;
    map["phone"] = phone;
    return map;
  }

  AddressRequest.fromJson(dynamic json){
    street = json["street"];
    city = json["city"];
    phone = json["phone"];
  }
}