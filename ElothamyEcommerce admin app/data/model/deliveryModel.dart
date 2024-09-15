class DeliveryModel {
  int? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryPhoneNumber;
  int? deliveryVerifycode;
  int? deliveryApprove;
  String? deliveryCreat;
  int? totalitemsPrice;
  int? deliveryCridit;

  DeliveryModel(
      {this.deliveryId,
      this.deliveryName,
      this.deliveryEmail,
      this.deliveryPassword,
      this.deliveryPhoneNumber,
      this.deliveryVerifycode,
      this.deliveryApprove,
      this.deliveryCreat,
      this.totalitemsPrice,
      this.deliveryCridit});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPassword = json['delivery_password'];
    deliveryPhoneNumber = json['delivery_phoneNumber'];
    deliveryVerifycode = json['delivery_verifycode'];
    deliveryApprove = json['delivery_Approve'];
    deliveryCreat = json['delivery_Creat'];
    totalitemsPrice = json['totalitemsPrice'];
    deliveryCridit = json['delivery_cridit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['delivery_email'] = this.deliveryEmail;
    data['delivery_password'] = this.deliveryPassword;
    data['delivery_phoneNumber'] = this.deliveryPhoneNumber;
    data['delivery_verifycode'] = this.deliveryVerifycode;
    data['delivery_Approve'] = this.deliveryApprove;
    data['delivery_Creat'] = this.deliveryCreat;
    data['totalitemsPrice'] = this.totalitemsPrice;
    data['delivery_cridit'] = this.deliveryCridit;
    return data;
  }
}
