import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late double deviceHeight, deviceWidth;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.1,
              width: deviceWidth,
            ),
            const Text(
              'HEEM',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 33,
              ), //black: 0xFF000000
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            const Text(
              'Create New Account',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 25,
              ), //black: 0xFF000000
            ),
            SignUpForm(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
              emailController: emailController,
              passwordController: passwordController,
              //nameController: nameController,
            )
          ],
        ),
      ),
    );
  }
}
