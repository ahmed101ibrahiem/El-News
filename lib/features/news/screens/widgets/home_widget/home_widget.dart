// import 'package:flutter/material.dart';
//
// class HomeWidget extends StatelessWidget {
//   const HomeWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return NestedScrollView(
//       headerSliverBuilder:(context, innerBoxIsScrolled) => [
//         SliverAppBar(
//           expandedHeight: 30,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           hintText: 'search...',
//                         ),
//                       ),
//                       Icon(Icons.search,color:Color(0xff818181) ,)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Icon(Icons.add_alert_outlined,color: Colors.white,),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [Color(0xffFF3A44),Color(0xffFF8086)],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//       body: SingleChildScrollView(
//         child: Column(
//
//         ),
//       ),
//     );
//   }
// }
