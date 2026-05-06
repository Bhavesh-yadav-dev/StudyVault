import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const GridCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Move decoration to the outer container to save space
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E6DF)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: const Color(0xFF7F77DD),
            child: Padding(
              padding: const EdgeInsets.all(10), // Reduced padding to fit more text
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end, // Aligns content to bottom
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 20)),
                  // We use Flexible instead of Spacer to prevent "Pixel Overflow"
                  const Flexible(child: SizedBox(height: double.infinity)), 
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16, // Smaller font is safer
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 1, // Reduced to 1 line to guarantee no overflow
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class GridCard extends StatelessWidget {
//   final String emoji;
//   final String title;
//   final String subtitle;
//   final VoidCallback onTap;

//   const GridCard({
//     super.key,
//     required this.emoji,
//     required this.title,
//     required this.subtitle,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: onTap,
//         splashColor: const Color(0xFF7F77DD),
//         highlightColor: const Color(0xFF7F77DD),
//         child: Container(
//           padding: const EdgeInsets.all(12), // Reduced slightly for more space
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: const Color(0xFFE8E6DF)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(emoji, style: const TextStyle(fontSize: 22)),
//               const Spacer(), // Pushes the text block to the bottom
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis, // Added this
//                     style: const TextStyle(
//                       fontSize: 17, // Reduced from 20 for better fit
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF1A1A1A),
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     subtitle,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis, // Added this
//                     style: const TextStyle(
//                       fontSize: 12, // Reduced from 15 for better fit
//                       color: Color(0xFF999999),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }