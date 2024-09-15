class OnTheWayOrderModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersTypes;
  int? ordersPriceDelivery;
  int? ordersPrice;
  int? ordersTotalPrice;
  int? ordersCoupon;
  String? ordersDatatime;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? ordersRating;
  String? ordersNoteRating;
  int? deldeliveryId;
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;
  int? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryPhoneNumber;
  int? deliveryVerifycode;
  int? deliveryApprove;
  String? deliveryCreat;

  OnTheWayOrderModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersTypes,
      this.ordersPriceDelivery,
      this.ordersPrice,
      this.ordersTotalPrice,
      this.ordersCoupon,
      this.ordersDatatime,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersRating,
      this.ordersNoteRating,
      this.deldeliveryId,
      this.addressId,
      this.addressUserid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong,
      this.addressName,
      this.deliveryId,
      this.deliveryName,
      this.deliveryEmail,
      this.deliveryPassword,
      this.deliveryPhoneNumber,
      this.deliveryVerifycode,
      this.deliveryApprove,
      this.deliveryCreat});

  OnTheWayOrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersTypes = json['orders_types'];
    ordersPriceDelivery = json['orders_priceDelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_totalPrice'];
    ordersCoupon = json['orders_coupon'];
    ordersDatatime = json['orders_datatime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersNoteRating = json['orders_noteRating'];
    deldeliveryId = json['deldelivery_id'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat =  json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPassword = json['delivery_password'];
    deliveryPhoneNumber = json['delivery_phoneNumber'];
    deliveryVerifycode = json['delivery_verifycode'];
    deliveryApprove = json['delivery_Approve'];
    deliveryCreat = json['delivery_Creat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_types'] = this.ordersTypes;
    data['orders_priceDelivery'] = this.ordersPriceDelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalPrice'] = this.ordersTotalPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datatime'] = this.ordersDatatime;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_rating'] = this.ordersRating;
    data['orders_noteRating'] = this.ordersNoteRating;
    data['deldelivery_id'] = this.deldeliveryId;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_name'] = this.addressName;
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['delivery_email'] = this.deliveryEmail;
    data['delivery_password'] = this.deliveryPassword;
    data['delivery_phoneNumber'] = this.deliveryPhoneNumber;
    data['delivery_verifycode'] = this.deliveryVerifycode;
    data['delivery_Approve'] = this.deliveryApprove;
    data['delivery_Creat'] = this.deliveryCreat;
    return data;
  }
}