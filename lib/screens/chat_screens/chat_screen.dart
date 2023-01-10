import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/models/chat_model.dart';
import 'package:flutter_pet_app/models/status_model.dart';
import 'package:flutter_pet_app/widgets/widget_exports.dart';
import 'package:gap/gap.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F7),
      appBar: CommonAppBarWidget(
        appbarName: 'Messages',
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // status row
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 24,
                        child: Icon(EvaIcons.plus),
                        backgroundColor: Colors.white,
                      ),
                      const Gap(8),
                      Text("Add"),
                    ],
                  ),
                  const Gap(8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: StatusServices.StatusModels.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        var chats = StatusServices.StatusModels[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: chats.hasStatus == true
                                      ? Colors.red
                                      : Colors.transparent,
                                ),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage(chats.userImage),
                                  backgroundColor: const Color(0xFFDFE0E3),
                                ),
                              ),
                              const Gap(8),
                              Text(chats.userName),
                            ],
                          ),
                        );
                      },
                      // child: ,
                    ),
                  ),
                ],
              ),
            ),
            // chat
            Expanded(
              child: ListView.builder(
                itemCount: ChatServices.chats.length,
                itemBuilder: (context, index) {
                  var chats = ChatServices.chats[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Color(0xFFDFE0E3),
                                  backgroundImage: AssetImage(
                                    chats.userImage,
                                  ),
                                ),
                                const Gap(16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      chats.userName,
                                      style: const TextStyle(
                                        fontFamily: 'poppins_bold',
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      chats.userMessage,
                                      style: const TextStyle(
                                        fontFamily: 'poppins_regular',
                                        fontSize: 12,
                                        color: ColorConstants.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  chats.time,
                                  style: const TextStyle(
                                    fontFamily: 'poppins_bold',
                                    fontSize: 12,
                                    color: ColorConstants.green,
                                  ),
                                ),
                                const Gap(8),
                                chats.numberOfMesssages != 0
                                    ? Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorConstants.green,
                                        ),
                                        child: Text(
                                          "${chats.numberOfMesssages}",
                                          style: const TextStyle(
                                            fontFamily: 'poppins_regular',
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
