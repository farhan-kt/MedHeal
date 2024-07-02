import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medheal/service/chat_service.dart';
import 'package:medheal/view/user/profile/widget_profile.dart';
import 'package:provider/provider.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:medheal/controller/chat_provider.dart';

class UserChatScreen extends StatefulWidget {
  const UserChatScreen({super.key});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  final ChatService chatservice = ChatService();

  @override
  void initState() {
    super.initState();
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    chatProvider.scrollController = ScrollController();
    chatProvider.getMessages(chatProvider.adminId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 280,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/Medheal logo.jpg'),
            ),
            SizedBox(
              width: size.width * .025,
            ),
            poppinsHeadText(
                text: 'MedHeal', color: const Color(0xFF1995AD), fontSize: 20)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, value, child) {
                return value.allMessage.isEmpty
                    ? Center(
                        child: poppinsHeadText(
                            text: 'Start a conversation..',
                            color: const Color(0xFF1995AD)),
                      )
                    : ListView.builder(
                        reverse: true,
                        itemCount: value.allMessage.length,
                        itemBuilder: (context, index) {
                          FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                          bool isSender = value.allMessage[index].senderId ==
                              firebaseAuth.currentUser!.uid;
                          DateTime timestamp =
                              value.allMessage[index].timestamp!;
                          String formattedTime =
                              DateFormat('hh:mm a').format(timestamp);
                          return chatBubble(
                            size,
                            isSend: isSender,
                            message: value.allMessage[index].message!,
                            time: formattedTime,
                          );
                        },
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: chatProvider.messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (chatProvider.messageController.text.isNotEmpty) {
                      await chatProvider.sendMessage(chatProvider.adminId);
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
