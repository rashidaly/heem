import 'package:flutter/material.dart';

import '../Models/products.dart';

class ItemCard extends StatelessWidget {
  //inal ProductModels products;
  final Product products;
  final void Function() press,  cartPress;
  const ItemCard({
    Key? key,
    required this.products,
    required this.press,
    required this.cartPress

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(1),
              //   padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.black, // 0xFF3A3B3C
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                child: Hero(
                  tag: products.id,
                  child: Image.asset(products.image),
                ),
              ),
            ),
          ),
          Padding(
            //  padding: const EdgeInsets.symmetric(
            //     vertical: 5, horizontal: 5), //5 / 4 vertical
            padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
            child: Text(
              products.title,
              style: const TextStyle(
                  color: Color(0xffffffff)), //HEEM gold: 0xffba8d25
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Row(
              children: [
                Text(
                  "\$${products.price}",
                  style: const TextStyle(
                      color: Color(0xFFf8d47c)), //Heem gold: 0xffba8d25
                  //  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: cartPress, icon: const Icon(Icons.add_shopping_cart,
                color: Colors.white,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
