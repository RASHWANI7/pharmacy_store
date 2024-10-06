import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacy_store/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key}) : preferredSize = const Size.fromHeight(65.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.primary_color,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 25,
          ),
          Text(
            'Snake Pharmacy',
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'cart_page');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
