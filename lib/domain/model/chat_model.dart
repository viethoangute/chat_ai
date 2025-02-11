class ChatModel {
  final String content;
  final bool isUser;
  final DateTime timestamp;

  ChatModel(
      {required this.content, required this.isUser, required this.timestamp});
}
