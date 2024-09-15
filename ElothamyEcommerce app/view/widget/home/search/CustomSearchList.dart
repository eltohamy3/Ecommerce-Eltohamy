import 'package:cached_network_image/cached_network_image.dart';
import 'package:eltohmayecommerceapp/core/constant/linkApi.dart';
import 'package:eltohmayecommerceapp/core/constant/mycolors.dart';
import 'package:eltohmayecommerceapp/core/constant/routename.dart';
import 'package:eltohmayecommerceapp/core/function/translateDatabase.dart';
import 'package:eltohmayecommerceapp/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchList extends StatelessWidget {
  final List<ItemsModel> SearchList;
  const CustomSearchList({super.key, required this.SearchList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: SearchList.length,
      itemBuilder: (context, index) => 
    InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.productDetails , arguments: {
                    "itemsModel":SearchList[index]
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Card(
                      surfaceTintColor: AppColor.white,
                      color: AppColor.white,
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                // flex: 2,
                                child: CachedNetworkImage(
                                  imageUrl: 
                                  "${LinkAPI.ItemsImage}/${SearchList[index].itemsImage}",
                                  height: 110,
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: ListTile(
                                      title: Text(
                                        translateDataBase(
                                            SearchList[index].itemsName!,
                                            SearchList[index].itemsNameAr!),
                                            style: const TextStyle(fontWeight: FontWeight.bold ,
                                            ),
                                      ),  
                                      subtitle: Text(
                                        translateDataBase(
                                            SearchList[index].categoriesName!,
                                            SearchList[index].categoriesNameAr!),
                                      ))),
                            ],
                  
                          
                        
                      )),
                ),
              ))
    ;
  }
}
