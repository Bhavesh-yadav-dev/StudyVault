import 'package:flutter/material.dart';
import 'package:studyvault/gridcart.dart';
import 'package:studyvault/landing_page.dart';
import 'package:studyvault/loadingscreen.dart';
import 'package:url_launcher/url_launcher.dart';


class FirstYearPage extends StatefulWidget {
  const FirstYearPage({super.key});

  @override
  State<FirstYearPage> createState() => _FirstYearPageState();
}

class _FirstYearPageState extends State<FirstYearPage> {
  Future<void> openWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        debugPrint("Could not launch $url");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

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
                  "Academic Assistant",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "first student page ",
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
       actions: [
  IconButton(
    icon: const Icon(Icons.arrow_forward),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const LandingPage(), // your target page
        ),
      );
    },
  ),
],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              _buildCard(
                '📄',
                'PYQ',
                'Previous year papers',
                () => openWebsite(
                  "https://drive.google.com/drive/folders/1Jf21zeuuZuXRBRrGF-tzStWubMLzYdBf",
                ),
              ),
              _buildCard(
                '📋',
                'Syllabus',
                '4th sem CSE',
                () => openWebsite(
                  "https://drive.google.com/drive/folders/1f2lBjqn7brpkfeuAxjwun7FUtPlw5Plu",
                ),
              ),

              _buildCard(
                '⏰',
                'Coming Soon',
                'More features',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Loadingscreen()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to keep the code clean
  Widget _buildCard(
    String emoji,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: GridCard(
        emoji: emoji,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
      ),
    );
  }
}
