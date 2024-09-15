import 'package:eltohmayecommerceapp/controller/orders/archivedOrdersController.dart';
import 'package:eltohmayecommerceapp/core/constant/imageasset.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class CustomRating extends GetView<ArchivedOrderControllerImp> {
  final int orderid;

  const CustomRating({super.key, required this.orderid});

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      submitButtonTextStyle: TextStyle(
        color: AppColor.secondarycolor ,
        fontSize: 20 ,
        fontWeight: FontWeight.bold
      ),
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Ecommerce Eltohamy Order Rating',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating for the Order',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15 , 
        
        ),
      ),
      // your app's logo?
      image: Image.asset(
        AppImageAsset.logo,
        width: 100,
        height: 100,
      ),
      submitButtonText: 'Submit',
      commentHint: 'Enter any comment about the order',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        controller.RatingOrder(response.rating, orderid, response.comment);
        // // TODO: add your own logic
        // if (response.rating < 3.0) {
        //   // send their comments to your email or anywhere you wish
        //   // ask the user to contact you instead of leaving a bad review
        // } else {
        //   // _rateAndReviewApp();
        // }
      },
    );
  }
}
