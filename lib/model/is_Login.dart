import 'package:flutter/material.dart';
import 'package:pharmacy_store/view/pages/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmacy_store/constants/constants.dart';
import 'package:pharmacy_store/view/pages/home_page.dart';

class IsLogin extends StatefulWidget {
  const IsLogin({super.key});

  @override
  State<IsLogin> createState() => _IsLoginState();
}

class _IsLoginState extends State<IsLogin> {
  String? token; // تعديل للتعامل مع null
  bool initial = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // دالة لفحص حالة تسجيل الدخول
  void _checkLoginStatus() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    String? storedToken = sharedpref.getString(Constants.Access_Token);

    setState(() {
      initial = false;
      token = storedToken;
      print('token: $token');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (initial) {
      // عرض دائرة التحميل في البداية
      return Center(
          child: CircularProgressIndicator(
        color: Constants.primary_color,
      ));
    } else {
      // التحقق من حالة الـ token
      if (token == null) {
        // إذا لم يكن هناك token، توجه إلى صفحة تسجيل الدخول
        return const Intro_Page();
      } else {
        // إذا كان هناك token، توجه إلى الصفحة الرئيسية
        return const Home_Page();
      }
    }
  }
}
