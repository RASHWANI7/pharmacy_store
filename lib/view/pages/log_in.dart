import 'package:flutter/material.dart';
import 'package:pharmacy_store/view/widgets/text_field.dart';
import 'package:pharmacy_store/view/widgets/my_button.dart';
import 'package:pharmacy_store/constants/constants.dart';
import 'package:pharmacy_store/model/Auth_Provider.dart';
import 'package:provider/provider.dart';

class Log_In extends StatefulWidget {
  const Log_In({super.key});

  @override
  State<Log_In> createState() => _Log_InState();
}

class _Log_InState extends State<Log_In> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Constants.primary_color,
                Constants.secondary_color
              ])),
              child: const Padding(
                padding: EdgeInsets.only(top: 55.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hello\nSign in !',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 35.0, right: 35, top: 50, bottom: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text_Field(
                              controller: emailController,
                              hint: 'Email',
                              icon: Icons.check,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text_Field(
                              controller: passwordController,
                              hint: 'Password',
                              icon: Icons.visibility_off,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forget Password ?',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                            My_Button(
                              text: 'Log In',
                              onTap: () {
                                if (emailController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  ShowSnackBar('all field are required');
                                  authProvider.setLoading(false);
                                }
                                // } else if (passwordController.text
                                //         .toString()
                                //         .length <
                                //     8) {
                                //   ShowSnackBar(
                                //       'the password field must be at least 8 characters');
                                //   authProvider.setLoading(false);
                                //
                                // } else if (!emailController.text
                                //     .toString()
                                //     .endsWith('@gmail.com')) {
                                //   ShowSnackBar(
                                //       'the email field must be a valid email address');
                                //   authProvider.setLoading(false);
                                // }
                                else {
                                  authProvider.login(
                                      emailController.text.toString(),
                                      passwordController.text.toString(),
                                      context);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Do not have an account',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'sign_up');
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
