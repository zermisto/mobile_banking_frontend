import 'package:flutter/material.dart';
//import 'package:mbanking_mock/services/student_service.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';
import 'package:mbanking_mock/university_screen/fee_detail_screen/fee_detail_screen.dart';
import 'package:mbanking_mock/widgets/bottom_nav_bar.dart';

import '../confirm_screen/confirm_screen.dart';
import '../home_screen/home_screen.dart';
//import 'package:mbanking_mock/widgets/student_card.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
   bool _isChecked1 = false;
   bool _isChecked2 = false;
   bool _isChecked3 = false;
   bool _isChecked4 = false;

  //widget that makes a picture into a button that (gesture detector)
  //when on tap, the image will appear with box shadow and border color black
  //it should required only 1 parameter, which is the image path
  Widget buildImageButton({required String imagePath}) {
      return GestureDetector(
    onTap: () {
      setState(() {
        if (imagePath == 'assets/images/bank_payment.png') {
          _isChecked1 = true;
          _isChecked2 = false;
          _isChecked3 = false;
          _isChecked4 = false;
        } else if (imagePath == 'assets/images/credit_card_payment.png') {
          _isChecked1 = false;
          _isChecked2 = true;
          _isChecked3 = false;
          _isChecked4 = false;
        } else if (imagePath == 'assets/images/qr_code_payment.png') {
          _isChecked1 = false;
          _isChecked2 = false;
          _isChecked3 = true;
          _isChecked4 = false;
        } else if (imagePath == 'assets/images/installment_plan.png') {
          _isChecked1 = false;
          _isChecked2 = false;
          _isChecked3 = false;
          _isChecked4 = true;
        }
      });
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _getBorderColor(imagePath),
          width: 1,
        ),
        boxShadow: [
          if (_isChecked(imagePath))
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    ),
  );
}

  bool _isChecked(String imagePath) {
    if (imagePath == 'assets/images/bank_payment.png') {
      return _isChecked1;
    } else if (imagePath == 'assets/images/credit_card_payment.png') {
      return _isChecked2;
    } else if (imagePath == 'assets/images/qr_code_payment.png') {
      return _isChecked3;
    } else if (imagePath == 'assets/images/installment_plan.png') {
      return _isChecked4;
    } else {
      return false;
    }
  }

  Color _getBorderColor(String imagePath) {
    if (_isChecked(imagePath)) {
      return ThemeColor.cmklBlackText;
    } else {
      return Colors.transparent;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    //final studentList = StudentService().getStudentList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
        backgroundColor: ThemeColor.bblBlue2,
        title: const Text('Payment Option'),
        titleTextStyle: ThemeText.cmklWhiteTitle,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text(
                  'TUITION FEE',
                  style: TextStyle(
                    color: ThemeColor.cmklBlackText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 125,
                  decoration: BoxDecoration(
                    color: ThemeColor.cmklGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ThemeColor.cmklGrey,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            'SEMESTER',
                            style: TextStyle(
                              color: Color.fromARGB(128, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '285,000.00',
                            style: TextStyle(
                              color: ThemeColor.cmklBlackText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            '2023',
                            style: TextStyle(
                              color: Color.fromARGB(128, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeeDetail()),
                          );
                        },
                        child: const Row(
                          children: [
                            SizedBox(width: 15),
                            Text(
                              'View Details',
                              style: TextStyle(
                                color: ThemeColor.bblBlue2,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'PAYMENT OPTION',
                  style: TextStyle(
                    color: ThemeColor.cmklBlackText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 260,
                  decoration: BoxDecoration(
                    color: ThemeColor.cmklGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ThemeColor.cmklGrey,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              buildImageButton(imagePath: 'assets/images/bank_payment.png'),
                              const SizedBox(height: 20),
                              buildImageButton(imagePath: 'assets/images/credit_card_payment.png'),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              buildImageButton(imagePath: 'assets/images/qr_code_payment.png'),
                              const SizedBox(height: 20),
                              buildImageButton(imagePath: 'assets/images/installment_plan.png'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                buildElevatedButton(
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ComfirmationScreen()),
                      );
                    })
              ],
            )),
      ),
    );
  }
}

Widget buildElevatedButton({
  required String text,
  required VoidCallback onPressed,
}) =>
    SizedBox(
      width: 450,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ThemeColor.cmklOrange,
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(55),
          ),
        ),
        child: Text(text),
      ),
    );
