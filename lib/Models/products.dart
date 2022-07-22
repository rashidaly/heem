import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int id;
  final int size;
  final double price;
//  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
   // required this.color,
  });
/*  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      description: snap['description'],
      id: snap['id'],
      image: snap['image'],
      title: snap['title'],
      price: snap['price'],
      size: snap['size'],
    );
    return product;
  }
}*/


  Map<String, dynamic> toJson() =>
      {'id': id, 'image': image, 'description': description, 'size': size,
        'title': title, 'price': price,// 'color': color
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    price: json['price'],
    //color: json['color'],
    image: json['image'],
    size: json['size'],
    title: json['title'],
    description: json['description'],

  );
}

List<Product> products = [
  Product(
    id: 1,
    title: "D8 1g Cartridge",
    price: 19.99,
    size: 12,
    description: dummyText,
    image: "assets/images/cart.gif",
   // color: Colors.blue,
  ),
  Product(
      id: 2,
      title: "D8 1g Disposable",
      price: 24.99,
      size: 12,
      description: dummyText,
      image: "assets/images/disposable.gif",
     // color: const Color(0xFFD3A984)),
),
  Product(
      id: 3,
      title: "Heem Grinder Card",
      price: 6.99,
      size: 12,
      description: dummyText,
      image: "assets/images/card.gif",
     // color: const Color(0xFF989493)
),
  Product(
      id: 4,
      title: "D9 Gummy Edibles",
      price: 11.99,
      size: 12,
      description: dummyText,
      image: "assets/images/ediblesD9square.JPG",
     // color: const Color(0xFFE6B398)
  ),
  Product(
      id: 5,
      title: "Heem Grinder Card",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/heemtest.gif",
    //  color: const Color(0xFF989493)
  ),
  Product(
      id: 6,
      title: "Snuff Straw",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/cokestraw.gif",
     // color: const Color(0xFF989493)
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
