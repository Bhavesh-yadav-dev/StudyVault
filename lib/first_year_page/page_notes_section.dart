import 'package:flutter/material.dart';


class NotesSection extends StatefulWidget {
  const NotesSection({super.key});

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6CFC4),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 241, 241),
        elevation: 2,
        toolbarHeight: 120,
        flexibleSpace: SafeArea(
          // Ensures content stays below the status bar
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "ALL Subjects",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.arrow_forward),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (_) => const LandingPage(), // your target page
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),

      body: Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3,
          padding: const EdgeInsets.symmetric(horizontal: 15),
        
          children: [
            ElevatedButton(onPressed: () {}, child: Text("M2")),
          ],
        ),
      ),
    );
  }
}
