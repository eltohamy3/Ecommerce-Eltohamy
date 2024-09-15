import 'package:eltohamyecommerceadminapp/core/constant/routename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final Function(String)? onChanged;
  final void Function()? onSearchIconPress;

  final TextEditingController? searchController;
  const CustomAppBar(
      {super.key,
      this.searchController,
      required this.titleAppBar,
      this.onChanged,
      required this.onSearchIconPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 60,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            onChanged: onChanged,
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onSearchIconPress,
                    icon: Icon(Icons.search, color: Colors.grey[600])),
                hintText: titleAppBar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: Colors.grey[200]),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            height: 60,
            child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoute.favoritePage);
                },
                icon: Icon(
                  Icons.favorite_outline,
                  size: 30,
                  color: Colors.grey[600],
                )),
          )
        ],
      ),
    );
  }
}
