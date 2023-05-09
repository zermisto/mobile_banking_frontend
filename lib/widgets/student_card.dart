import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mbanking_mock/university_screen/fee_detail_screen/fee_detail_screen.dart';
import 'package:mbanking_mock/university_screen/home_screen/home.dart';
//import 'package:flutter/services.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';

import '../bkk_screen/pay_option/pay_option_screen.dart';
//import 'package:intl/intl.dart';

class StudentCard extends StatelessWidget {
  //final Color backGroundColor;
  final String imagePath;
  final String? name;
  final String? surname;
  final String? year;
  final String? fallSemesterGrade;
  final String? cumulativeGrade;
  final String? tuitionFee;

  const StudentCard({
    // required this.backGroundColor,
    required this.imagePath,
    required this.name,
    required this.surname,
    required this.year,
    required this.fallSemesterGrade,
    required this.cumulativeGrade,
    required this.tuitionFee,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final formatter = NumberFormat('#,000');

    Color backgroundColor;
    if (year == 'Year 1') {
      backgroundColor = const Color(0xFFDFE8F7);
    } else {
      backgroundColor = const Color(0xFFFAD2C8);
    }
    return Container(
      width: 240,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110,
                  child: ClipOval(
                    child: Image.asset(imagePath),
                  ),
                ),
                const SizedBox(height: 20),
                if (name != null)
                  Text(
                    name!,
                    style: ThemeText.cmklBlackSubHeader,
                  ),
                const SizedBox(height: 2),
                if (surname != null)
                  Text(
                    surname!,
                    style: ThemeText.cmklBlackSubLine,
                  ),
                const SizedBox(height: 7),
                if (year != null)
                  Text(
                    year!,
                    style: ThemeText.cmklBlueSubLine,
                  ),
                const SizedBox(height: 20),
                DottedLine(
                  dashColor: ThemeColor.cmklBlack.withOpacity(0.5),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'GPA',
                      style: ThemeText.cmklBlackSubHeader,
                    ),
                    const Spacer(),
                    //add iconbutton
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeUni(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: ThemeColor.cmklBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (fallSemesterGrade != null)
                      const Text(
                        'Fall semester 22',
                        style: ThemeText.cmklGreySubLine,
                      ),
                    if (fallSemesterGrade != null)
                      Text(
                        fallSemesterGrade!,
                        style: ThemeText.cmklBlackSubLine2,
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cumulative',
                      style: ThemeText.cmklGreySubLine,
                    ),
                    if (cumulativeGrade != null)
                      Text(
                        cumulativeGrade!,
                        style: ThemeText.cmklBlackSubLine2,
                      ),
                  ],
                ),
                const SizedBox(height: 14),
                DottedLine(
                  dashColor: ThemeColor.cmklBlack.withOpacity(0.5),
                ),
                Row(
                  children: [
                    const SizedBox(height: 5),
                    const Text(
                      'TUITON FEE',
                      style: ThemeText.cmklBlackSubHeader,
                    ),
                    const Spacer(),
                    //add iconbutton
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeeDetail(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: ThemeColor.cmklBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                if (tuitionFee != null)
                  Text(
                    // '${formatter.format(tuitionFee)} Baht',  //format 3 0s comma
                    tuitionFee!,
                    style: ThemeText.cmklGreySubLine,
                  ),
                const SizedBox(height: 5),
                const Text(
                  'Due tomorrow',
                  style: ThemeText.cmklRedSubLine,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.cmklOrange,
                    foregroundColor: Colors.white,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'PAY  NOW',
                      style: ThemeText.cmklButtonLabel,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentOption()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
