// import 'package:bordered_text/bordered_text.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:netflix/core/colors/colors.dart';

// import '../../../core/constants.dart';

// class NumberCard extends StatelessWidget {
//   final int index;
//   const NumberCard({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           children: [
//             const SizedBox(
//               width: 35,
//               height: 200,
//             ),
//             Container(
//               width: 110,
//               height: 200,
//               decoration: BoxDecoration(
//                 borderRadius: kRadius,
//                 color: Colors.purpleAccent,
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                     //Loki//
//                     "https://i.pinimg.com/564x/2b/3e/2d/2b3e2d8da22a12d3b563c4714064093d.jpg",
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Positioned(
//           left: 0,
//           bottom: -24,
//           child: BorderedText(
//             strokeWidth: 6.0,
//             strokeColor: kWhite,
//             child: Text(
//               "${index+1}",
//               style: GoogleFonts.workSans(fontSize: 125,fontWeight: FontWeight.bold,color: kBlack),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
