class AuthModel {
  AuthModel({
    String? message,
    String? token,
    User? user,
    String? id,
  }) {
    _message = message;
    _token = token;
    _user = user;
    _id = id;
  }

  AuthModel.fromJson(dynamic json) {
    _message = json['message'];
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _id = json['_id'];
  }
  String? _message;
  String? _token;
  User? _user;
  String? _id;
  AuthModel copyWith({
    String? message,
    String? token,
    User? user,
    String? id,
  }) =>
      AuthModel(
        message: message ?? _message,
        token: token ?? _token,
        user: user ?? _user,
        id: id ?? _id,
      );
  String? get message => _message;
  String? get token => _token;
  User? get user => _user;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['_id'] = _id;
    return map;
  }
}

class User {
  User({
    String? email,
    String? password,
    String? role,
    bool? isActive,
    bool? verified,
    List<String>? wishlist,
    String? id,
    List<String>? addresses,
  }) {
    _email = email;
    _password = password;
    _role = role;
    _isActive = isActive;
    _verified = verified;
    _wishlist = wishlist;
    _id = id;
    _addresses = addresses;
  }

  User.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _role = json['role'];
    _isActive = json['isActive'];
    _verified = json['verified'];
    _wishlist = json['wishlist'] != null ? json['wishlist'].cast<String>() : [];
    _id = json['_id'];
    _addresses =
        json['addresses'] != null ? json['addresses'].cast<String>() : [];
  }
  String? _email;
  String? _password;
  String? _role;
  bool? _isActive;
  bool? _verified;
  List<String>? _wishlist;
  String? _id;
  List<String>? _addresses;
  User copyWith({
    String? email,
    String? password,
    String? role,
    bool? isActive,
    bool? verified,
    List<String>? wishlist,
    String? id,
    List<String>? addresses,
  }) =>
      User(
        email: email ?? _email,
        password: password ?? _password,
        role: role ?? _role,
        isActive: isActive ?? _isActive,
        verified: verified ?? _verified,
        wishlist: wishlist ?? _wishlist,
        id: id ?? _id,
        addresses: addresses ?? _addresses,
      );
  String? get email => _email;
  String? get password => _password;
  String? get role => _role;
  bool? get isActive => _isActive;
  bool? get verified => _verified;
  List<String>? get wishlist => _wishlist;
  String? get id => _id;
  List<String>? get addresses => _addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['role'] = _role;
    map['isActive'] = _isActive;
    map['verified'] = _verified;
    map['wishlist'] = _wishlist;
    map['_id'] = _id;
    map['addresses'] = _addresses;
    return map;
  }
}
