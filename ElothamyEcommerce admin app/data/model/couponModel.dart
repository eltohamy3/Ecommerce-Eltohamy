class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  String? couponExpiredata;
  int? couponDiscount;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpiredata,
      this.couponDiscount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpiredata = json['coupon_expiredata'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_expiredata'] = this.couponExpiredata;
    data['coupon_discount'] = this.couponDiscount;
    return data;
  }
}
