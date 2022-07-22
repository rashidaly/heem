
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heem/database/bd_helper.dart';
import 'package:heem/starting_page.dart';
import 'package:provider/provider.dart';

import '../../contoller/cart_provider.dart';
import '../../models/cart_review.dart';


class CartScreen extends StatefulWidget {


  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper dbHelper = DBHelper();
  String? qty;
  int count = 1;
  bool isTrue = false;
 // final CartController controller = Get.put(CartController());

  late double deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
 appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "My Cart",
            style:
                TextStyle(color: Colors.black, fontSize: deviceHeight * 0.03),
          ),
          leading: IconButton(
            onPressed: () {
              Get.offAll(() => const StartingPage());
            },
            icon: const Icon(
              Icons.home_rounded,
              color: Colors.black,
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: deviceWidth * 0.05,
              right: deviceWidth * 0.05,
              top: deviceHeight * 0.02,
            ),
            height: deviceHeight * .23,
            width: deviceWidth * .9,
            decoration: BoxDecoration(
              //color: products[index].color.withOpacity(.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              
              children: [
                FutureBuilder(
                  future: cart.getData(),
                    builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                    if(snapshot.hasData){
                      return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: deviceWidth * 0.05,
                                  right: deviceWidth * 0.05,
                                  top: deviceHeight * 0.02,
                                ),
                                height: deviceHeight * .23,
                                width: deviceWidth * .9,
                                decoration: BoxDecoration(
                                  //color: products[index].color.withOpacity(.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                     snapshot.data![index].productName ?? '',
                                      style: TextStyle(
                                        fontSize: deviceHeight * 0.03,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].productPrice.toString(),
                                      style: TextStyle(
                                        fontSize: deviceHeight * 0.03,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            int quanitity = snapshot.data![index].quantity!;
                                            int? price = snapshot.data![index].initialPrice!;
                                            quanitity--;
                                            int newPrice = price * quanitity;
                                            if (quanitity > 0){
                                              dbHelper.updateQuanitity(
                                                  Cart(
                                                      id: snapshot.data![index].id,
                                                      productId: snapshot.data![index].id.toString(),
                                                      productName: snapshot.data![index].productName,
                                                      initialPrice: snapshot.data![index].initialPrice,
                                                      productPrice: newPrice,
                                                      quantity: quanitity,
                                                      cartDescription: snapshot.data![index].cartDescription,
                                                      image: snapshot.data![index].image)
                                              ).then((value) {
                                                newPrice = 0;
                                                quanitity= 0;
                                                cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice.toString()));
                                              }).catchError((error, stackTrace){
                                                print(error.toString());
                                              });

                                            }




                                          },
                                        ),
                                        Text(
                                          snapshot.data![index].quantity.toString(),
                                          style: TextStyle(
                                            fontSize: deviceHeight * 0.03,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            int quanitity = snapshot.data![index].quantity!;
                                            int? price = snapshot.data![index].initialPrice!;
                                            quanitity++;
                                            int newPrice = price * quanitity;
                                            dbHelper.updateQuanitity(
                                                Cart(
                                                    id: snapshot.data![index].id,
                                                    productId: snapshot.data![index].id.toString(),
                                                    productName: snapshot.data![index].productName,
                                                    initialPrice: snapshot.data![index].initialPrice,
                                                    productPrice: newPrice,
                                                    quantity: quanitity,
                                                    cartDescription: snapshot.data![index].cartDescription,
                                                    image: snapshot.data![index].image)
                                            ).then((value) {
                                              newPrice = 0;
                                              quanitity= 0;
                                              cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice.toString()));
                                            }).catchError((error, stackTrace){
                                              print(error.toString());
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],

                                ),
                              );


                              }
                          )
                      );
                    }else {
                      return Center(child: CircularProgressIndicator());
                    }
                    }
                )
                
                

              ],

            ),
          )
        ),


/*Column(
            children: [
              StreamBuilder<List<ReviewCartModel>>(
                  stream: cartProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      Text('No Data');
                    } else if (snapshot.hasData) {
                      final user = snapshot.data;
                      return ListView(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        children: user!.map(cartBuild).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
              Container(
                height: (deviceHeight * .1) + 40,
                width: deviceWidth,
                color: Colors.black,
               // padding: const EdgeInsets.only(bottom: 50, top: 10),
                child: Row(

                  children: [
                    Text(
                      "Total:\t",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceHeight * 0.025,
                      ),
                    ),
                    Text(
                      "Rs. ${getTotalPrice()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: deviceHeight * 0.025,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentScreen()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey.shade100,
                        ),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: deviceHeight * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),*/

        ),
      );

  }
 /* List<ReviewCartModel> reviewCartDataList = [];
  Stream<List<ReviewCartModel>> cartProduct() =>
      FirebaseFirestore.instance.collection('cart').snapshots().map((event) =>
          event.docs.map((doc) => ReviewCartModel.fromJson(doc.data())).toList());

  Widget cartBuild(reviewCartDataList) => Container(
    margin: EdgeInsets.only(
      left: deviceWidth * 0.05,
      right: deviceWidth * 0.05,
      top: deviceHeight * 0.02,
    ),
    height: deviceHeight * .23,
    width: deviceWidth * .9,
    decoration: BoxDecoration(
      //color: products[index].color.withOpacity(.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          reviewCartDataList.cartName ?? '',
          style: TextStyle(
            fontSize: deviceHeight * 0.03,
            color: Colors.black,
          ),
        ),
        Text(
          reviewCartDataList.cartPrice.toString(),
          style: TextStyle(
            fontSize: deviceHeight * 0.03,
            color: Colors.black,
          ),
        ),

        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
              onPressed: () {

              },
            ),
            Text(
              reviewCartDataList.cartQuantity.toString(),
              style: TextStyle(
                fontSize: deviceHeight * 0.03,
                color: Colors.black,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],

    ),
  );

 getTotalPrice(){

   double total = 0.0;

  for (var element in reviewCartDataList) {
    total += element.cartPrice * element.cartQuantity;

   }
  return total;
 }*/

}
