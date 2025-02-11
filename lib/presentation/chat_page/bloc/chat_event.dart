abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;
  SendMessageEvent({required this.message});
}

class ClearChatEvent extends ChatEvent {}