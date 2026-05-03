import 'dart:convert';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:studyvault/chatmsg.dart';
import 'package:studyvault/constants.dart';


class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _HomepageState();
}

class _HomepageState extends State<Chatbot> {
  TextEditingController userinput = TextEditingController();
  //store chat
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Study Assistant",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];

                  return Align(
                    alignment: msg.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: msg.isUser ? Colors.blue : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: msg.isUser
                          ? Text(
                              msg.text,
                              style: const TextStyle(color: Colors.white),
                            )
                          : GptMarkdown(msg.text),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: TextField(
                style: TextStyle(
                  color: Colors.white, // 👈 your text color
                  fontSize: 16,
                ),
                controller: userinput,
                decoration: InputDecoration(
                  hintText: "Ask me anything...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (userinput.text.trim().isEmpty) return;

                      String userText = userinput.text.trim();

                      setState(() {
                        messages.add(ChatMessage(text: userText, isUser: true));
                      });

                      userinput.clear();

                      getresponse(userText);
                    },
                    icon: const Icon(Icons.send),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getresponse(String userText) async {
    String url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent?key=$apikey";

    // Show typing indicator
    setState(() {
      messages.add(ChatMessage(text: "Typing...", isUser: false));
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "system_instruction": {
            "parts": [
              {"text": trainAccordingToMe},
            ],
          },
          "contents": [
            {
              "parts": [
                {"text": userText},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        // Safe extraction
        final aiMessage =
            decodedData['candidates']?[0]?['content']?['parts']?[0]?['text'] ??
            "No response";

        setState(() {
          // Remove typing safely
          if (messages.isNotEmpty && messages.last.text == "Typing...") {
            messages.removeLast();
          }

          messages.add(ChatMessage(text: aiMessage, isUser: false));
        });
      } else {
        setState(() {
          if (messages.isNotEmpty && messages.last.text == "Typing...") {
            messages.removeLast();
          }

          messages.add(
            ChatMessage(
              text: "Error: Server issue (${response.statusCode})",
              isUser: false,
            ),
          );
        });
      }
    } catch (e) {
      setState(() {
        if (messages.isNotEmpty && messages.last.text == "Typing...") {
          messages.removeLast();
        }

        messages.add(
          ChatMessage(text: "Error: Something went wrong", isUser: false),
        );
      });
    }
  }
}
//   void getresponse() async {
//     String url =
//         "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent?key=$apikey";

//     Map<String, dynamic> parambody = {
//       "system_instruction": {
//         "parts": [
//           {"text": trainAccordingToMe},
//         ],
//       },
//       "contents": [
//         {
//           "parts": [
//             {"text": userinput.text},
//           ],
//         },
//       ],
//     };
//     var response = await http.post(
//       Uri.parse(url),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(parambody),
//     );

//     if (response.statusCode == 200) {
//       var decodedData = jsonDecode(response.body);
//       String aiMessage =
//           decodedData['candidates'][0]['content']['parts'][0]['text'];

//       setState(() {
//         messages.add(ChatMessage(text: aiMessage, isUser: false));
//       });
//     } else {
//       log("Error Code: ${response.statusCode}");
//       log("Error Body: ${response.body}");
//     }
//   }
// }
