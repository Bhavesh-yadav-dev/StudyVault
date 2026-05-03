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
    return Material(
      color: Colors.transparent, // important for ripple
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: Color(0xFF7F77DD),
        highlightColor: Color(0xFF7F77DD),
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFFE8E6DF)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(emoji, style: TextStyle(fontSize: 22)),
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}