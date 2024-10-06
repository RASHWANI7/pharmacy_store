// import 'package:flutter/material.dart';
// import 'package:pharmacy_store/view/widgets/countainer_shape.dart';
// import 'package:pharmacy_store/constants/constants.dart';
// import 'package:pharmacy_store/view/widgets/appBar.dart';
// import 'package:pharmacy_store/view/widgets/drawer.dart';
// import 'package:provider/provider.dart';
//
// import '../../model/shop.dart';
//
// class Home_Page extends StatefulWidget {
//   const Home_Page({super.key});
//   @override
//   State<Home_Page> createState() => _Home_PageState();
// }
//
// class _Home_PageState extends State<Home_Page> {
//   late Future<void> _medicineFuture;
//   int numberOfPages = 7;
//   int currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     final medicineProvider = Provider.of<Shop>(context, listen: false);
//     _medicineFuture = _initializeMedicines(medicineProvider);
//   }
//
//   Future<void> _initializeMedicines(Shop medicineProvider) async {
//     await medicineProvider.getMedicine(currentPage.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final medicineProvider = Provider.of<Shop>(context);
//     // var pages = List.generate(numberOfPages, (index) {
//     //   medicineProvider.getMedicine(currentPage.toString());
//     // });
//     return SafeArea(
//         child: Scaffold(
//       appBar: const CustomAppBar(),
//       drawer: const CustomDrawer(),
//       body: FutureBuilder(
//           future: _medicineFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                         itemCount: medicineProvider.Medicines_list.length,
//                         itemBuilder: (context, index) {
//                           return countainer_shape(
//                             medicineProvider: medicineProvider,
//                             index: index,
//                           );
//                         }),
//                   ),
//                 ],
//               );
//             } else {
//               return Center(
//                   child: CircularProgressIndicator(
//                 color: Constants.primary_color,
//               ));
//             }
//           }),
//     ));
//   }
// }

//..............................................................................

//cccccccccccccccccccccccccccccc
// import 'package:flutter/material.dart';
// import 'package:pharmacy_store/view/widgets/countainer_shape.dart';
// import 'package:pharmacy_store/constants/constants.dart';
// import 'package:pharmacy_store/view/widgets/appBar.dart';
// import 'package:pharmacy_store/view/widgets/drawer.dart';
// import 'package:provider/provider.dart';
// import 'package:number_paginator/number_paginator.dart';
//
// import '../../model/shop.dart';
//
// class Home_Page extends StatefulWidget {
//   const Home_Page({super.key});
//   @override
//   State<Home_Page> createState() => _Home_PageState();
// }

// class _Home_PageState extends State<Home_Page> {
//   late Future<void> _medicineFuture;
//   int numberOfPages = 7;
//   int currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _medicineFuture = _getMedicine(1); // استدعاء التابع عند تحميل الصفحة الأولى
//   }
//
//   Future<void> _getMedicine(int page) async {
//     final medicineProvider = Provider.of<Shop>(context, listen: false);
//     await medicineProvider.getMedicine('$page');
//   }
//
//   Future<void> _updatePage(int page) async {
//     setState(() {
//       currentPage = page;
//       _medicineFuture = _getMedicine(page + 1); // استدعاء التابع مع رقم الصفحة
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final medicineProvider = Provider.of<Shop>(context);
//     return SafeArea(
//       child: Scaffold(
//         appBar: const CustomAppBar(),
//         drawer: const CustomDrawer(),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: FutureBuilder(
//             future: _medicineFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
//                 return Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: medicineProvider.Medicines_list.length,
//                           itemBuilder: (context, index) {
//                             return countainer_shape(
//                               medicineProvider: medicineProvider,
//                               index: index,
//                             );
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: NumberPaginator(
//                           numberPages: numberOfPages,
//                           onPageChange: (int index) {
//                             _updatePage(index); // تحديث الصفحة عند تغيير الصفحة
//                           },
//                           config: NumberPaginatorUIConfig(
//                             buttonSelectedBackgroundColor:
//                                 Constants.primary_color,
//                             buttonShape: BeveledRectangleBorder(
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: Constants.primary_color,
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

//ccccccccccccccccccccccccccccccccccccccccccccc

//+++++++++++++++++++++++++++++++++++++++++++
import 'package:flutter/material.dart';
import 'package:pharmacy_store/view/widgets/countainer_shape.dart';
import 'package:pharmacy_store/constants/constants.dart';
import 'package:pharmacy_store/view/widgets/appBar.dart';
import 'package:pharmacy_store/view/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../model/shop.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  late Future<void> _medicineFuture;
  int numberOfPages = 7;
  int currentPage = 0;

  @override
  void initState() {
    final medicineProvider = Provider.of<Shop>(context, listen: false);
    super.initState();
    _medicineFuture = medicineProvider.getMedicine('1');
  }

  Future<void> togetmedicine(int current) async {
    final medicineProvider = Provider.of<Shop>(context, listen: false);
    return medicineProvider.getMedicine('$current');
  }

  @override
  Widget build(BuildContext context) {
    final medicineProvider = Provider.of<Shop>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _medicineFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: medicineProvider.Medicines_list.length,
                          itemBuilder: (context, index) {
                            return countainer_shape(
                              medicineProvider: medicineProvider,
                              index: index,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: NumberPaginator(
                          numberPages: numberOfPages,
                          onPageChange: (int index) {
                            setState(() {
                              currentPage = index;
                              _medicineFuture = togetmedicine(
                                  currentPage); // تحديث البيانات عند تغيير الصفحة
                            });
                          },
                          config: NumberPaginatorUIConfig(
                            buttonSelectedBackgroundColor:
                                Constants.primary_color,
                            buttonShape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Constants.primary_color,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
