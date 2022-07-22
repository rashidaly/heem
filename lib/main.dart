
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heem/firebase_options.dart';
import 'package:heem/splash_screen.dart';
import 'package:provider/provider.dart';

import 'components/firebase.dart';
import 'contoller/authController.dart';
import 'contoller/cart_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_live_51L9jELAEWYqiMwmxwvGYxpK919p3V12z8UBv6wDAacrJ3t8Ndtjp1Za9NK3epxId6Eb8UqSpofynWlTwOAN4OSK600Yg1Qy4Gl';
  //'pk_test_51L9jELAEWYqiMwmxA5iEZ3ExwcRDNCTRbnJT2TFGiQgEqqa7nX8ugGy7l1kACwdjAvCjcYmHphhpO01jJvG2TFtX00tuaAWKeh';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialization.then((value) {
    Get.put(UserController());
  });
  runApp(const Heem());
}

class Heem extends StatelessWidget {
  const Heem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Builder(builder: (context) {
          return GetMaterialApp(
            theme: ThemeData(
              primaryColor: Colors.amberAccent[700],
              fontFamily: 'ArchivoBlack',
            ),
            home: const SplashScreen(),
            // home: const SignInScreen(),
          );
        }));
  }
}
