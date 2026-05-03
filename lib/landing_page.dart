import 'package:flutter/material.dart';
import 'package:studyvault/chatbot.dart';
import 'package:studyvault/first_year_page/first_year_page.dart';
import 'package:studyvault/gridcart.dart';
import 'package:studyvault/loadingscreen.dart';
import 'package:url_launcher/url_launcher.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Logic: Use try-catch for better error handling with url_launcher
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
        elevation: 2, // Reduced for a cleaner look
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
                  "What do you need?",
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
      ),
      body: Column(
        children: [
          // AI Helper Section
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Chatbot()),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1A1A2E),
                ),
                padding: const EdgeInsets.all(
                  15,
                ), // Use padding instead of fixed height
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.smart_toy,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Expanded prevents the text from overflowing the screen
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "AI Helper",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Ask anything — DSA, DBMS, OS, JAVA",
                            style: TextStyle(
                              color: Color.fromARGB(255, 132, 184, 233),
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Grid Section wrapped in Expanded to take up remaining space
          Expanded(
            child: GridView.count(
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
                  () => openWebsite("https://drive.google.com/..."),
                ),
                _buildCard(
                  '📋',
                  'Syllabus',
                  '4th sem CSE',
                  () => openWebsite("https://drive.google.com/..."),
                ),
                _buildCard(
                  '📝',
                  'Notes',
                  'Imp Topics',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Loadingscreen()),
                  ),
                ),

                Card(
                  child: GridCard(
                    emoji: "🎓",
                    title: "First Year section",
                    subtitle: "Syllabus & important questions",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FirstYearPage(),
                        ),
                      );
                    },
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
