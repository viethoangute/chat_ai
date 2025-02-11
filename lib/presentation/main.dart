import 'package:chat_ai/presentation/chat_page/bloc/chat_bloc.dart';
import 'package:chat_ai/presentation/chat_page/views/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => getIt<ChatBloc>(),
        child: const ChatPage(),
      ),
    );
  }
}
