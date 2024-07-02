import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:provider/provider.dart';
import 'package:medheal/controller/chat_provider.dart';
import 'package:medheal/model/authentication_model.dart';
import 'package:medheal/view/user/profile/widget_profile.dart';

class AdminChatPage extends StatefulWidget {
  UserModel userinfo;
  AdminChatPage({Key? key, required this.userinfo}) : super(key: key);

  @override
  State<AdminChatPage> createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChatProvider>(context, listen: false)
        .getMessages(widget.userinfo.uId!);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 600,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            CircleAvatar(
                radius: 20,
                backgroundColor: const Color.fromARGB(255, 173, 182, 186),
                backgroundImage: widget.userinfo.image != null
                    ? NetworkImage(widget.userinfo.image!)
                    : const AssetImage('assets/avatar-removebg-preview.png')
                        as ImageProvider),
            SizedBox(
              width: size.width * .02,
            ),
            poppinsHeadText(text: widget.userinfo.userName ?? 'unknown')
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
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
                            bool isSender = value.allMessage[index].senderId ==
                                chatProvider.adminId;
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
              padding: const EdgeInsets.all(8.0),
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
                        await chatProvider.sendMessage(widget.userinfo.uId!);
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
