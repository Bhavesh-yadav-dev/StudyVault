import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studyvault/contants/notes_conatiner.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesSection extends StatefulWidget {
  const NotesSection({super.key});

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
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
        actions: [
          IconButton(
            onPressed: () {
              context.go('initialpage');
            },
            icon: Icon((Icons.arrow_forward_ios)),
          ),

        ],
      ),

      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.3,
          padding: EdgeInsets.all(20),

          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     openWebsite("https://drive.google.com/file/d/1-zYKMr1zI16XI9FfQYPo__u5trd1PQM7/view");
            //   },
            //   child: Text("M2"),
            // ),
            NotesConatiner(
              subjectname: "M2",
              ontap: () {
                openWebsite(
                  "https://drive.google.com/file/d/1-zYKMr1zI16XI9FfQYPo__u5trd1PQM7/view",
                );
              },
            ),
            NotesConatiner(subjectname: "Chemistry", ontap: () {}),
            NotesConatiner(
              subjectname: "physics",
              ontap: () {
                openWebsite(
                  "https://drive.google.com/drive/u/2/folders/1q3gMKuSH5aQfJaqEw8Yc1J3Ch73Ef8tJ",
                );
              },
            ),
            NotesConatiner(
              subjectname: "M1",
              ontap: () {
                openWebsite("");
              },
            ),
            NotesConatiner(
              subjectname: "C programming",
              ontap: () {
                openWebsite(
                  "https://drive.google.com/drive/u/2/folders/1eGBVRyhZxCgDokkUV5RPboM8MQEMCh91",
                );
              },
            ),
            NotesConatiner(subjectname: "Python", ontap: () {}),
            NotesConatiner(subjectname: "Cyber law & Ethics", ontap: () {}),
            NotesConatiner(
              subjectname: "Basic Electrial Engg",
              ontap: () {
                openWebsite(
                  "https://drive.google.com/drive/u/2/folders/1KsZpIq9Aruo-RoWg-YnLPF-WOE8V3h8I",
                );
              },
            ),
            NotesConatiner(subjectname: "FOC", ontap: () {}),
            NotesConatiner(subjectname: "English", ontap: () {}),
          ],
        ),
      ),
    );
  }
}
