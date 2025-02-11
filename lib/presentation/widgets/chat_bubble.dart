import 'package:chat_ai/domain/model/chat_model.dart';
import 'package:flutter/cupertino.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel chatModel;

  const ChatBubble({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    const Color userChatColor = Color(0xFFF1F1FE);
    const Color responseChatColor = Color(0xFFF6F7F9);

    BorderRadius userChatBorder = const BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    );

    BorderRadius responseChatBorder = const BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
    );

    const EdgeInsetsGeometry userChatMargin = EdgeInsets.only(
      left: 66,
      right: 16,
      bottom: 16,
    );

    const EdgeInsetsGeometry responseChatMargin = EdgeInsets.only(
      right: 66,
      left: 16,
      bottom: 16,
    );

    return Row(
      mainAxisAlignment:
      chatModel.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            margin: chatModel.isUser ? userChatMargin : responseChatMargin,
            padding: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(
              maxWidth: 250, // Limit max width
            ),
            decoration: BoxDecoration(
              color: chatModel.isUser ? userChatColor : responseChatColor,
              borderRadius: chatModel.isUser ? userChatBorder : responseChatBorder,
            ),
            child: Text(
              chatModel.content,
              style: const TextStyle(color: Color(0xFF242424), fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
