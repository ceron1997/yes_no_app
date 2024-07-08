import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/chat/chat_screen.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ], // el guion bajo es para decir que no me ineteresa el parametro context
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Yes No App',
          theme: Apptheme(selectedColor: 0).theme(),
          home: const ChatScreen()),
    );
  }
}
