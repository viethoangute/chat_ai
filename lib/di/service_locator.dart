import 'package:chat_ai/data/claude_api_service.dart';
import 'package:get_it/get_it.dart';

import '../presentation/chat_page/bloc/chat_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /* Register Claude API Service
    We're using Claude AI to response from your questions.
    Go to: https://www.anthropic.com/api for more detail.
  */
  String apiKey = 'YOUR_API_KEY';
  getIt.registerLazySingleton<ClaudeApiService>(
      () => ClaudeApiService(apiKey: apiKey));

  // Register ChatBloc
  getIt.registerFactory(() => ChatBloc(getIt<ClaudeApiService>()));
}
