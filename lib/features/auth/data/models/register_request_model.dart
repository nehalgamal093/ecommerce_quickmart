class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? phone;

  RegisterRequestModel({this.name, this.email, this.password, this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
