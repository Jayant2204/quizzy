// import 'package:flutter/material.dart';
// import 'package:quizzy/global/constants.dart';

// class ProgressBar extends StatelessWidget {
//   const ProgressBar({
//     Key? key,
//     required this.percentage,
//   }) : super(key: key);

//   final double percentage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 35,
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color(0xFF3F4768), width: 3),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Stack(
//         children: [
//           // LayoutBuilder provide us the available space for the conatiner
//           // constraints.maxWidth needed for our animation
//           LayoutBuilder(
//             builder: (context, constraints) => Container(
//               // from 0 to 1 it takes 60s
//               width: constraints.maxWidth * percentage,
//               decoration: BoxDecoration(
//                 gradient: kPrimaryGradient,
//                 borderRadius: BorderRadius.circular(50),
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: kDefaultPadding / 2,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('${(percentage * 60).round()} sec'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
