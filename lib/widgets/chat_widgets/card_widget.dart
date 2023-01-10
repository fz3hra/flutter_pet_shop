import 'package:flutter/material.dart';
import 'package:flutter_pet_app/constants/constant_exports.dart';
import 'package:flutter_pet_app/models/chat_model.dart';
import 'package:gap/gap.dart';

class ChatWidget extends StatelessWidget {
  ChatModel? chats;
  ChatWidget({
    super.key,
    this.chats,
  });

  @override
  Widget build(BuildContext context) {
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
                      chats!.userImage,
                    ),
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chats!.userName,
                        style: const TextStyle(
                          fontFamily: 'poppins_bold',
                          fontSize: 16,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        chats!.userMessage,
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
                    chats!.time,
                    style: const TextStyle(
                      fontFamily: 'poppins_bold',
                      fontSize: 12,
                      color: ColorConstants.green,
                    ),
                  ),
                  const Gap(8),
                  chats!.numberOfMesssages != 0
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstants.green,
                          ),
                          child: Text(
                            "${chats!.numberOfMesssages}",
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
  }
}
