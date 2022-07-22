import 'package:flutter/material.dart';
import 'package:heem/Pages/auth/sign_in/sign_in_form.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //AuthController controller = Get.find();

  late double deviceHeight, deviceWidth;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              'Sign In',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 30,
              ), //black: 0xFF000000
            ),
            SignInForm(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
              emailController: emailController,
              passwordController: passwordController,
            )
          ],
        ),
      ),
    );
  }
}
