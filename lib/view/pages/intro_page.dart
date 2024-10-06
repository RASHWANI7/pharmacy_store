import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacy_store/constants/constants.dart';
import 'package:pharmacy_store/view/widgets/my_button.dart';

class Intro_Page extends StatelessWidget {
  const Intro_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'lib/view/images/pharmacy_image.png',
                height: 300,
              ),
              Text(
                'Snake Pharmacy',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 43,
                  fontWeight: FontWeight.bold,
                  color: Constants.primary_color,
                ),
              ),
              Text(
                'Your first and best choice',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Center(
                  child: My_Button(
                      text: 'Get Started',
                      onTap: () {
                        Navigator.pushNamed(context, 'log_in');
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
