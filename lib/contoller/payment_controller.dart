

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              applePay: true,
              googlePay: true,
              testEnv: true,
              merchantCountryCode: 'US',
              merchantDisplayName: 'Rashid',
              customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
            )
        );
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
      );
    }
    on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      }
      else {
        print("Unforeseen error: ${e}");
      }
    }
    catch (e) {
      print("exception:$e");
    }
  }


  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer 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',
                //'sk_test_51L9jELAEWYqiMwmxW9WTcVzNE5CepZfS1gyRv2a4UPx2Hi0sLv6X3vsyjaEC2ZWHp1E7LQrIHYvu3PpCRkJwj0aq00lZFcfAMv',
            'Content-Type': 'application/x-www-form-urlencoded'
          }
      );
      return jsonDecode(response.body);
    } catch (e) {
      print('err charging user: ${e.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}




