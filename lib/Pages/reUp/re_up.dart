import 'dart:core';

import 'package:flutter/material.dart';
import 'package:heem/components/item_card.dart';

import 'package:provider/provider.dart';

import '../../Database/bd_helper.dart';
import '../../Models/cart_review.dart';
import '../../Models/products.dart';
import '../../contoller/cart_provider.dart';
import '../Prouduct_view/product_view.dart';


class ReUp extends StatefulWidget {

  const ReUp({Key? key}) : super(key: key);
  @override
  State<ReUp> createState() => _ReUpState();
}

class _ReUpState extends State<ReUp> {




  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: .85,
                ),
                itemBuilder: (context, index) => ItemCard(
                      products: products[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductViewScreen(
                            products: products[index],
                          ),
                        ),
                      ),
                  cartPress: () {
                      //  print(products[index].id.toString(),);
              /*      dbHelper.insert(
                        *//*Cart(
                          id: index,//products[index].id,
                          productId: index.toString(),//products[index].id.toString(),
                          initialPrice: products[index].price.round(),
                          productPrice:  products[index].price.round(),
                          image: products[index].image,
                          productName: products[index].title,
                          cartDescription: products[index].description,
                          quantity: 1,

                        )*//*
                    ).then((value) {
                      cart.addTotalPrice(products[index].price.toDouble());
                      cart.addCounter();
                      print('add to cart');

                    }).onError((error, stackTrace) {
                      print(stackTrace.toString());
                    }*/
                 //   );
                  },
                    )
            ),
          ),
        ],
      ),
    );
  }
  // void setState(Null Function() param0) {}
}
