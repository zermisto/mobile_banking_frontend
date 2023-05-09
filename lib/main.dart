
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/home_screen.dart';
//import 'package:mbanking_mock/bkk_screen/pay_option/pay_option_screen.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/university_screen/home_screen/home.dart';





void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColor.bblBlueLight,
        ),
        useMaterial3: true,
      ),
      home: const HomeUni(),
    );
  }
}
