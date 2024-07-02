import 'package:flutter/material.dart';
import 'package:medheal/view/admin/admin_chat.dart';
import 'package:medheal/widgets/text_widgets.dart';
import 'package:provider/provider.dart';
import 'package:medheal/controller/chat_provider.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChatProvider>(context, listen: false).getAllChats();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: poppinsHeadText(text: 'Chats', fontSize: 20),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * .01),
        child: Consumer<ChatProvider>(
          builder: (context, value, child) => value.myAllChat.isEmpty
              ? const Center(child: Text("No chats available"))
              : ListView.builder(
                  itemCount: value.myAllChat.length,
                  itemBuilder: (context, index) {
                    final chat = value.myAllChat[index];
                    final userInfo = chat.userInfo;

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdminChatPage(userinfo: userInfo),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * .1,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundColor: const Color.fromARGB(
                                        255, 173, 182, 186),
                                    backgroundImage: userInfo?.image != null
                                        ? NetworkImage(userInfo!.image!)
                                        : const AssetImage(
                                                'assets/avatar-removebg-preview.png')
                                            as ImageProvider),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    poppinsText(
                                        text: userInfo?.userName ??
                                            'Unknown User',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    poppinsText(
                                        text: userInfo!.email,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ],
                                )
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
