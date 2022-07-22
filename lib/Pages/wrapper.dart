import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heem/components/controllers.dart';
import 'package:heem/starting_page.dart';

import 'auth/sign_in/sign_in.dart';
import 'auth/sign_up/sign_up.dart';



class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var isSignedIn = false;
  var isLoading = true;

  void initializeWrapper() async {
    bool isLoggedIn = await userController.isUserLoggedIn();


    print("got the value2 in here $isSignedIn");


    isLoading = false;
    isSignedIn = isLoggedIn;

    if (isSignedIn) {
      Get.off(
        // () => const CartScreen(),
        () => const StartingPage(),
      );
    } else {
      Get.off(
        () => const SignInScreen(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initializeWrapper();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    } else {
      if (isSignedIn) {
        Get.off(
          () => const SignUpScreen(),
        );
      } else {
        Get.off(
          () => const SignInScreen(),
        );
      }
    }
    return Container();
  }
}
