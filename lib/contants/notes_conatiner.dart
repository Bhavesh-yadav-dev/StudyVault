import 'package:flutter/material.dart';

class NotesConatiner extends StatelessWidget {
  final String subjectname;
  final VoidCallback ontap;
  const NotesConatiner({
    super.key,
    required this.subjectname,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 143, 228, 239),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              subjectname,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
