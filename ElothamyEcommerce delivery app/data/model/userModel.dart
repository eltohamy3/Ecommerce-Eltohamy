class UserModel {
  int? userId;
  String? username;
  String? email;
  String? password;
  String? phoneNumber;
  int? verifycode;
  int? userApprove;
  String? usersCreat;

  UserModel(
      {this.userId,
      this.username,
      this.email,
      this.password,
      this.phoneNumber,
      this.verifycode,
      this.userApprove,
      this.usersCreat});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    verifycode = json['verifycode'];
    userApprove = json['userApprove'];
    usersCreat = json['usersCreat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['verifycode'] = this.verifycode;
    data['userApprove'] = this.userApprove;
    data['usersCreat'] = this.usersCreat;
    return data;
  }
}