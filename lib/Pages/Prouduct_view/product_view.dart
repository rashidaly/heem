
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heem/Pages/Prouduct_view/pv_appbar.dart';

import 'package:heem/database/bd_helper.dart';
import 'package:heem/models/cart_review.dart';

import 'package:provider/provider.dart';

import '../../Models/products.dart';
import '../../contoller/cart_provider.dart';
import '../Cart/cart_screen.dart';



class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({
    Key? key,
    required this.products,
  }) : super(key: key);
  //final ProductModels products;
  final Product products;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  DBHelper dbHelper = DBHelper();
  int? index;
 // final CartController controller = Get.put(CartController());
  late double deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context) {
    final cart =Provider.of<CartProvider>(context);
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, //widget.product.color,
        appBar: buildAppBar(context, Colors.black),



        //buildAppBar(context, Colors.black),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: deviceHeight * 0.25),
              padding: const EdgeInsets.only(bottom: 20),
              height: deviceHeight * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: deviceHeight * 0.02,
                    width: deviceWidth,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\t\tDescription",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: deviceHeight * 0.03,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                    width: deviceWidth,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: deviceHeight * 0.3,
                    width: deviceWidth,
                    child: Text(
                      widget.products.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: deviceHeight * 0.02,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: deviceHeight * .1,
                    width: deviceWidth * .9,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        InkWell(

                          onTap: () {
                            dbHelper.insert(
                              Cart(
                                  id: widget.products.id,
                                productId: widget.products.id.toString(),
                                  initialPrice: widget.products.price.round(),
                                  productPrice:  widget.products.price.round(),
                                  image: widget.products.image,
                                  productName: widget.products.title,
                                  cartDescription: widget.products.description,
                                  quantity: 1,

                              )
                            ).then((value) {
                              cart.addTotalPrice(widget.products.price);
                              cart.addCounter();
                              print('add to cart');

                            }).onError((error, stackTrace) {
                               print(error.toString());
                               print('error');
                            });
                          },
                          child: Container(
                            height: deviceHeight * .07,
                            width: deviceWidth * .15,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              //  color: widget.product.color.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            // * implement add to cart
                            Get.to(() =>  const CartScreen());
                          },
                          child: Container(
                            height: deviceHeight * .07,
                            width: deviceWidth * .65,
                            decoration: BoxDecoration(
                              color: Colors
                                  .black, //widget.product.color.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: deviceHeight * .02,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ), //that 20 should be "default padding"
              child: Column(
                children: <Widget>[
                  Text(
                    widget.products.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5,
              child: SizedBox(
                height: deviceHeight * .25,
                child:Image.asset(widget.products.image),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
