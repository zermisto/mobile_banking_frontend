// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_color.dart';

import '../home_screen/home_screen.dart';
//import 'package:mbanking_mock/shared/theme_text.dart';

class PaymentSuccssfulScreen extends StatelessWidget {
  const PaymentSuccssfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/Paymentsuccess.png',
              width: double.infinity,
              height: 980.0,
              fit: BoxFit.cover,
            ),
            buildElevatedButton(
                text: "Done",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget buildElevatedButton({
  required String text,
  required VoidCallback onPressed,
}) =>
    SizedBox(
      width: 350,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ThemeColor.bblBlueDark,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        child: Text(text),
      ),
    );
