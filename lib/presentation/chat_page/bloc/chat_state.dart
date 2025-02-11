import 'package:chat_ai/domain/model/chat_model.dart';

abstract class ChatState {
  final List<ChatModel> messages;
  ChatState({required this.messages});
}

class ChatInitial extends ChatState {
  ChatInitial() : super(messages: []);
}

class ChatLoading extends ChatState {
  ChatLoading(List<ChatModel> messages) : super(messages: messages);
}

class ChatSuccess extends ChatState {
  ChatSuccess(List<ChatModel> messages) : super(messages: messages);
}