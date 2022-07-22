import 'cart_review.dart';

class Cart {
  late final int? id;
  final String? productId;
  final  String? productName;
  final  int? initialPrice;
  final  int? productPrice;
  final  int? quantity;
  final String? cartDescription;
  final String? image;

  Cart({
    required this.id,
    required this.productId,
    required  this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.quantity,
    required this.cartDescription,
    required this.image
  });

  Cart.fromMap (Map<dynamic, dynamic> res)
  : id = res['id'],
        productId = res['productId'],
        productName = res['productName'],
        initialPrice = res['initialPrice'],
        productPrice = res['productPrice'],
        quantity = res['quantity'],
        cartDescription = res['cartDescription'],
        image = res['image'];



 Map<String, dynamic> toMap(){
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'cartDescription': cartDescription,
      'image': image


    };
  }
}

