import 'package:flutter_pet_app/constants/constant_exports.dart';

class ChatModel {
  String userName, userImage, userMessage, time;
  int numberOfMesssages;
  ChatModel({
    required this.userName,
    required this.userImage,
    required this.userMessage,
    required this.time,
    required this.numberOfMesssages,
  });
}

class ChatServices {
  static List<ChatModel> chats = [
    ChatModel(
      userName: 'Sophia',
      userImage: ImageConstants.profileImage,
      userMessage: 'Hello, wahtsup?',
      time: '23 min',
      numberOfMesssages: 2,
    ),
    ChatModel(
      userName: 'Isabelle',
      userImage: ImageConstants.profileImage,
      userMessage: 'Hello, world?',
      time: '1 day',
      numberOfMesssages: 0,
    ),
  ];
}
