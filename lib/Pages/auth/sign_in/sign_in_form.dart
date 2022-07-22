import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../components/controllers.dart';
import '../sign_up/sign_up.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController emailController, passwordController;
  final double deviceHeight, deviceWidth;
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  //AuthController controller = Get.find();
  final formKey = GlobalKey<FormState>();
  bool isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.deviceHeight * .03,
      ),
      height: widget.deviceHeight * .5,
      width: widget.deviceWidth * .9,
      decoration: BoxDecoration(
        color: Colors.green.shade200.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: widget.deviceHeight * 0.05,
              width: widget.deviceWidth * .9,
            ),

            // * email input field
            TextFormField(
              controller: userController.email,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

            // * password input field
            SizedBox(
              height: widget.deviceHeight * 0.04,
              width: widget.deviceWidth * .9,
            ),
            TextFormField(
              controller: userController.password,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),

            // * sign in button

            SizedBox(
              height: widget.deviceHeight * 0.04,
              width: widget.deviceWidth * .9,
            ),
            ElevatedButton(
              onPressed: ()  {
                userController.signIn();
          /*      setState(() {
                  isSigningIn = true;
                });
                await controller.signIn(
                  email: widget.emailController.text,
                  password: widget.passwordController.text,
                );
                setState(() {
                  isSigningIn = false;
                });*/
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.all(0),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.transparent,
                ),
              ),
              child: Container(
                width: widget.deviceWidth * .8,
                height: widget.deviceHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: (isSigningIn)
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.offAll(
                  () => const SignUpScreen(),
                );
              },
              child: const Text(
                'Create New Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: widget.deviceHeight * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
