import 'package:flutter/material.dart';
import 'package:pharmacy_store/constants/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: Constants.primary_color,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/view/images/pharmacy_image.png',
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'ABOUT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 80,
              thickness: 2,
            ),
            const Row(
              children: [
                Icon(
                  Icons.logout,
                  size: 35,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
