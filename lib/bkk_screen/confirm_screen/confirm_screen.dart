import 'package:flutter/material.dart';

//import 'package:mbanking_mock/screens/pay_option/pay_option_screen.dart';

import 'package:mbanking_mock/shared/theme_color.dart';

import '../home_screen/home_screen.dart';
import '../succesful_payment_screen/successful_payment_screen.dart';
//import 'package:mbanking_mock/shared/theme_text.dart';

class ComfirmationScreen extends StatelessWidget {
  const ComfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/confirmation.png',
              width: double.infinity,
              height: 1150.0,
              fit: BoxFit.cover,
            ),
            buildElevatedButton(
                text: "Pay Now",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentSuccssfulScreen()),
                  );
                }),
            const SizedBox(height: 10),
            buildElevatedButton2(
                text: "Cancel this transaction",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }),
            const SizedBox(height: 10),
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
          backgroundColor: ThemeColor.bblBlue2,
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
Widget buildElevatedButton2({
  required String text,
  required VoidCallback onPressed,
}) =>
    SizedBox(
      width: 350,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: ThemeColor.bblBlue2,
          backgroundColor: Colors.white,
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
