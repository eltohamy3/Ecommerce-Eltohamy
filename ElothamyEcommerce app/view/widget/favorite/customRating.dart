import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRatingRow extends StatelessWidget {
  const CustomRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rating 3.5',
          style: TextStyle(color: AppColor.grey),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 22,
          child: Row(
            children: [
              ...List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        size: 15,
                      ))
            ],
          ),
        )
      ],
    );
  }
}
