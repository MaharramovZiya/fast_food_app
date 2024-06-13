import 'package:fast_food_app/src/provider/introduction_provider.dart';
import 'package:fast_food_app/src/views/home_screen/home_view.dart';
import 'package:fast_food_app/src/views/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<IntroductionProvider>(
          create: (context) => IntroductionProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroductionScreen(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}
