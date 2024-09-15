import 'package:eltohamyecommerceadminapp/core/class/crud.dart';
import 'package:eltohamyecommerceadminapp/core/constant/linkApi.dart';

// class to get the data from database
class CouponData {
  Crud crud;
  CouponData({required this.crud});

  PostCouponView() async {
    var responce = await crud.PostGetDataRequest(LinkAPI.couponView, {});
    return responce.fold((l) => l, (r) => r);
  }

  postDeleteCoupon(int coupon_id) async {
    var responce = await crud.PostGetDataRequest(
        LinkAPI.couponDelete, {"coupon_id": "$coupon_id"});
    return responce.fold((l) => l, (r) => r);
  }

  PostCouponAdd(Map data) async {
    print(data.toString());

    var responce = await crud.PostGetDataRequest(LinkAPI.couponAdd, data);
    return responce.fold((l) => l, (r) => r);
  }

  PostCouponEdit(Map data) async {
    print(data.toString());
    var responce = await crud.PostGetDataRequest(LinkAPI.couponEdit, data);
    return responce.fold((l) => l, (r) => r);
  }
}
