import 'package:eltohamyecommerceadminapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add ' , ),
      backgroundColor: AppColor.secondarycolor,
      actions: [
        IconButton(onPressed: (){}, icon:Icon(Icons.search) )
      ],
     ),
     
      body: Container(
        child: ListView(
          children: [
            

          ],
        ),
      ),
    );
  }
}