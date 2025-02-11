import 'package:chat_ai/data/claude_api_service.dart';
import 'package:chat_ai/domain/model/chat_model.dart';
import 'package:chat_ai/presentation/chat_page/bloc/chat_event.dart';
import 'package:chat_ai/presentation/chat_page/bloc/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ClaudeApiService _claudeApiService;
  final List<ChatModel> _messages = [];

  ChatBloc(this._claudeApiService) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<ClearChatEvent>(_onClearChat);
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    _messages.add(ChatModel(
      content: event.message,
      isUser: true,
      timestamp: DateTime.now(),
    ));
    emit(ChatLoading(List.from(_messages)));

    try {
      final response = await _claudeApiService.sendMessage(event.message);
      _messages.add(ChatModel(
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
      ));
    } catch (e) {
      _messages.add(ChatModel(
        content: "We encountered an issue. Please try again.",
        isUser: false,
        timestamp: DateTime.now(),
      ));
    }

    emit(ChatSuccess(List.from(_messages)));
  }

  void _onClearChat(ClearChatEvent event, Emitter<ChatState> emit) {
    _messages.clear();
    emit(ChatInitial());
  }
}
