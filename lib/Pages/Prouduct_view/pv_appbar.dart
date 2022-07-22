import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cart_screen.dart';


AppBar buildAppBar(BuildContext context, Color color) {
  return AppBar(
    backgroundColor: color,
    elevation: 0,
    leading: IconButton(
      icon: Image.asset(
        'assets/images/back_arrow.png',
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),

    actions: [
      IconButton(
        icon:
            Image.asset("assets/images/shopping_bag.png", color: Colors.white),
        onPressed: () {
          Get.to(() =>  CartScreen());
        },
      ),
      const SizedBox(width: 20 / 2),

    ],
  );
}
