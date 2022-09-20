class SignInModel {
  User? user;
  String? tokenType;
  String? token;

  SignInModel({this.user, this.tokenType, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token_type'] = this.tokenType;
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? address;
  String? phoneNumber;
  int? points;
  String? email;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.phoneNumber,
        this.points,
        this.email,
        this.isAdmin,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    points = json['points'];
    email = json['email'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['points'] = this.points;
    data['email'] = this.email;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}