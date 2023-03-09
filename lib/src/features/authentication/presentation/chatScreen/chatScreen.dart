import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple.shade100,
        centerTitle: false,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/onboarding.png'),
            ),
            SizedBox(width: 20,),
            Text("Target User")
          ],
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(child: Text("user chat")),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter message",
                    ),
                    controller: messageController,
                    maxLength: null,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.purple.shade100,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      messageController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
