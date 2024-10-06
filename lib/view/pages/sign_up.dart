import 'package:flutter/material.dart';
import 'package:pharmacy_store/constants/constants.dart';
import 'package:pharmacy_store/model/Auth_Provider.dart';
import 'package:pharmacy_store/view/widgets/text_field.dart';
import 'package:pharmacy_store/view/widgets/my_button.dart';
import 'package:provider/provider.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  void ShowSnackBar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Constants.primary_color,
        content: Center(
          child: Text(error),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Constants.primary_color,
                Constants.secondary_color
              ])),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        )),
                    const Text(
                      ' Creat a new account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 27),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      ' Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: (const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 20, right: 20, bottom: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20, right: 20, bottom: 20),
                            child: Column(
                              children: [
                                Text_Field(
                                  controller: firstnameController,
                                  hint: 'First Name',
                                  icon: null,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: lastnameController,
                                  hint: 'Last Name',
                                  icon: null,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: emailController,
                                  hint: 'Email',
                                  icon: null,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: passwordController,
                                  hint: 'Password',
                                  icon: null,
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: confirmpasswordController,
                                  hint: 'Confirm Password',
                                  icon: null,
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                My_Button(
                                  text: 'Confirm',
                                  onTap: () {
                                    authProvider.setLoading(true);
                                    if (firstnameController.text.isEmpty ||
                                        lastnameController.text.isEmpty ||
                                        emailController.text.isEmpty ||
                                        passwordController.text.isEmpty ||
                                        confirmpasswordController
                                            .text.isEmpty) {
                                      ShowSnackBar('all field are required');
                                      authProvider.setLoading(false);
                                    }
                                    // else if (!emailController.text
                                    //     .toString()
                                    //     .endsWith('@gmail.com')) {
                                    //   ShowSnackBar(
                                    //       'the email field must be a valid email address');
                                    //   authProvider.setLoading(false);
                                    // } else if (passwordController.text.length <
                                    //     8) {
                                    //   ShowSnackBar(
                                    //       'the password field must be at least 8 characters');
                                    //   authProvider.setLoading(false);
                                    // }
                                    else {
                                      authProvider.SignUp(
                                        firstnameController.text.toString(),
                                        lastnameController.text.toString(),
                                        emailController.text.toString(),
                                        passwordController.text.toString(),
                                        confirmpasswordController.text
                                            .toString(),
                                        context,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
