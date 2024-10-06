import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'medicine.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Shop extends ChangeNotifier {
  final List<Medicine> _Medicines = [];
  final List<Medicine> _card = [];

  late String _storedToken = '';

  Future<void> getMedicine(String url) async {
    _Medicines.clear();
    await getToken();
    try {
      final response = await http.get(
        headers: {
          'Authorization': 'Bearer $_storedToken',
          'Accept': 'application/json',
        },
        Uri.parse('http://26.231.83.119:51962/api/medicines?page=$url'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        //print(jsonResponse);
        for (var eachMedicine in jsonResponse['data']) {
          final medicine = Medicine(
            id: eachMedicine['id'],
            type: eachMedicine['type'],
            scientific_name: eachMedicine['scientific_name'],
            trade_name: eachMedicine['trade_name'],
            price: eachMedicine['price'].toDouble(),
            quantity: eachMedicine['quantity'].toInt(),
            photo_url: eachMedicine['photo_url'].toString(),
            manufacturer_id: eachMedicine['manufacturer_id'],
            expires_at: eachMedicine['expires_at'],
            expires_at_human: eachMedicine['expires_at_human'],
            manufacturer: eachMedicine['manufacturer'],
          );
          _Medicines.add(medicine);
          print(medicine.scientific_name);
        }
        print(_Medicines.length);
      } else {
        print('Failed to load medicines: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    notifyListeners();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.Access_Token);
    if (token != null) {
      _storedToken = token;
      print('Token retrieved: $_storedToken');
    } else {
      print('No token found');
    }
    notifyListeners();
  }

  List<Medicine> get Medicines_list => _Medicines;
  List<Medicine> get card => _card;

  void addToCard(Medicine medicine, int quanity) {
    for (int i = 0; i < quanity; i++) {
      _card.add(medicine);
    }
    notifyListeners();
  }

  void removeFromCard(Medicine medicine) {
    _card.remove(medicine);
    notifyListeners();
  }
}
