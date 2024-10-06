import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacy_store/model/shop.dart';
import 'package:pharmacy_store/constants/constants.dart';

class countainer_shape extends StatelessWidget {
  final Shop medicineProvider;
  final int index;

  const countainer_shape({
    super.key,
    required this.medicineProvider,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Constants.primary_color, width: 5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicineProvider.Medicines_list[index].scientific_name,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                medicineProvider.Medicines_list[index].trade_name,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                '\$ ${medicineProvider.Medicines_list[index].price}',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // child: Row(
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(30.0),
          //       child: Image.network(
          //         medicineProvider.Medicines_list[index].photo_url,
          //       ),
          //     ),

          //],
        ),
      ),
    );
  }
}
