import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomAppTheme(selectedColor: 5).theme(),
      home: Scaffold(
        // appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        // body: Center(
        //   child: FilledButton.tonal(onPressed: () {}, child: Text('Click Me')),
        // ),
        body:ChatScreen()
      ),
    );
  }
}