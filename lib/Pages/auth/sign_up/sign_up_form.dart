import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heem/components/controllers.dart';


import '../sign_in/sign_in.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.emailController,
    required this.passwordController,
  // required this.nameController
  }) : super(key: key);
  final TextEditingController emailController, passwordController;
      //nameController;
  final double deviceHeight, deviceWidth;
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
 // AuthController controller = Get.find();
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: widget.deviceHeight * .03,
      ),
      height: widget.deviceHeight * .6,
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
              controller:userController.email,
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

            //name
            SizedBox(
              height: widget.deviceHeight * 0.04,
              width: widget.deviceWidth * .9,
            ),
            TextFormField(
              controller: userController.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  labelText: 'Name',
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
                  return 'Please enter your Name';
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
              onPressed: () async {
                userController.signUp();
              /*  setState(() {
                  isSigningUp = true;
                });
                await controller.signUp(
                  email: widget.emailController.text,
                  password: widget.passwordController.text,
                );
                setState(() {
                  isSigningUp = true;
                });*/
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.all(0)),
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
                  child: (isSigningUp)
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : const Text(
                          'Sign Up',
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
                  () => const SignInScreen(),
                );
              },
              child: const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
