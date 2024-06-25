import 'package:flutter/material.dart';
import 'package:medheal/widgets/text_widgets.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {},
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

// import 'package:flutter/material.dart';
// import 'package:medheal/view/user/profile/widget_profile.dart';
// import 'package:medheal/widgets/text_widgets.dart';

// class UserChatScreen extends StatelessWidget {
//   const UserChatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     // Sample chat messages
//     List<Map<String, dynamic>> messages = [
//       {
//         'isSend': true,
//         'message': 'Hello, how can I help you?',
//         'time': '10:00 AM'
//       },
//       {
//         'isSend': false,
//         'message': 'I need assistance with my order.',
//         'time': '10:01 AM'
//       },
//       {
//         'isSend': true,
//         'message': 'Sure, can you please provide the order number?',
//         'time': '10:02 AM'
//       },
//       {'isSend': false, 'message': 'It is #12345.', 'time': '10:03 AM'},
//       {
//         'isSend': true,
//         'message': 'Thank you. I will check the details.',
//         'time': '10:04 AM'
//       },
//       {
//         'isSend': true,
//         'message': 'Hello, how can I help you?',
//         'time': '10:00 AM'
//       },
//       {
//         'isSend': false,
//         'message': 'I need assistance with my order.',
//         'time': '10:01 AM'
//       },
//       {
//         'isSend': true,
//         'message': 'Sure, can you please provide the order number?',
//         'time': '10:02 AM'
//       },
//       {'isSend': false, 'message': 'It is #12345.', 'time': '10:03 AM'},
//       {
//         'isSend': true,
//         'message': 'Thank you. I will check the details.',
//         'time': '10:04 AM'
//       },
//       {
//         'isSend': true,
//         'message': 'Hello, how can I help you?',
//         'time': '10:00 AM'
//       },
//       {
//         'isSend': false,
//         'message': 'I need assistance with my order.',
//         'time': '10:01 AM'
//       },
//       {
//         'isSend': true,
//         'message': 'Sure, can you please provide the order number?',
//         'time': '10:02 AM'
//       },
//       {'isSend': false, 'message': 'It is #12345.', 'time': '10:03 AM'},
//       {
//         'isSend': true,
//         'message': 'Thank you. I will check the details.',
//         'time': '10:04 AM'
//       },
//     ];

//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.only(
//             top: size.height * .07,
//             left: size.width * .03,
//             right: size.width * .03,
//             bottom: size.height * .01),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 22,
//                   backgroundImage: AssetImage('assets/Medheal logo.jpg'),
//                 ),
//                 SizedBox(
//                   width: size.width * .025,
//                 ),
//                 poppinsHeadText(
//                     text: 'MedHeal', color: Color(0xFF1995AD), fontSize: 20)
//               ],
//             ),
//             Divider(),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   return chatBubble(
//                     size,
//                     isSend: messages[index]['isSend'],
//                     message: messages[index]['message'],
//                     time: messages[index]['time'],
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Type a message...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () async {},
//                     icon: Icon(
//                       Icons.send,
//                       color: Color(0xFF1995AD),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
