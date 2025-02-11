import 'package:chat_ai/presentation/chat_page/bloc/chat_bloc.dart';
import 'package:chat_ai/presentation/chat_page/bloc/chat_event.dart';
import 'package:chat_ai/presentation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_state.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Chat AI'),
        leading: IconButton(
          icon: const Icon(
            Icons.add,
            size: 24,
          ),
          onPressed: () {
            context.read<ChatBloc>().add(ClearChatEvent());
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              size: 24,
            ),
            onPressed: () {
              context.read<ChatBloc>().add(ClearChatEvent());
            },
          )
        ],
      ),
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state.messages.isNotEmpty) {
                    return ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        return ChatBubble(chatModel: message);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Ask me everything...',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_upward_rounded, size: 24),
                    onPressed: () {
                      if (textController.text.trim().isNotEmpty) {
                        context.read<ChatBloc>().add(
                            SendMessageEvent(message: textController.text));
                        textController.clear();
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
