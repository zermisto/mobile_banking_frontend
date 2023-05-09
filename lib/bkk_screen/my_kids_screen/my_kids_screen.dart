import 'package:flutter/material.dart';
import 'package:mbanking_mock/models/student2.dart';
import 'package:mbanking_mock/services/get_student_data.dart';
//import 'package:mbanking_mock/services/student_service.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';
import 'package:mbanking_mock/widgets/bottom_nav_bar.dart';
import 'package:mbanking_mock/widgets/student_card.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../home_screen/controllers/profile_controller.dart';

// final List<String> idList = [
//   '12345678',
//   '1234567890',
//   '2134567890',
// ];

//make a list of images link
final List<String> imgList = [
  'assets/images/jenny.png',
  'assets/images/c.png',
  'assets/images/panupong.png',
  'assets/images/krittin.png',
  'assets/images/rawipol.png',
];

class MyKidsScreen extends StatelessWidget {
  const MyKidsScreen({super.key});

  //make function to call FutureBuilder and return String
  FutureBuilder<List<Student2>> futureFirstName({
    required List<String> idList,
    required ProfileController controller,
  }) =>
      FutureBuilder(
        future: GetStudentDataService().getstudentdata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final studentInfoList = snapshot.data as List<Student2>;

            return CarouselSlider.builder(
              itemCount: studentInfoList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                final studentInfo = studentInfoList[itemIndex];

                return StudentCard(
                  //backGroundColor: ThemeColor.cmklBlueLight,
                  // imagePath: 'assets/images/panupong.png',
                  imagePath: imgList[itemIndex],
                  name: studentInfo.firstName,
                  surname: studentInfo.lastName,
                  year: studentInfo.class1,
                  fallSemesterGrade: studentInfo.gpa,
                  cumulativeGrade: studentInfo.gpa,
                  tuitionFee: studentInfo.gpa,
                );
              },
              options: CarouselOptions(
                height: 550.0,
                viewportFraction: 0.7,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      );

  FutureBuilder<String?> futureLastName({
    required String studentId,
    required ProfileController controller,
  }) =>
      FutureBuilder(
        future: controller.getStudentLastName(studentId: studentId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String lastName = snapshot.data as String;
            return Text(lastName,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      );

  Widget buildFutureText({
    required Future<dynamic> future,
    required String successText,
    required String errorText,
  }) {
    return Column(
      children: [
        const SizedBox(height: 20),
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String data = snapshot.data as String;
              return Text("$successText: $data");
            } else if (snapshot.hasError) {
              return Text('$errorText: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.contentBackground,
      appBar: AppBar(
        backgroundColor: ThemeColor.bblBlue2,
        title: const Text('My Kids'),
        titleTextStyle: ThemeText.cmklWhiteTitle,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    const Text(
                      'STUDENT',
                      style: ThemeText.cmklBlackHeader,
                    ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/noti.png',
                        width: 31,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/cmkl_logo.png',
                        width: 33,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              futureFirstName(
                idList: const ['12345678', '1234567890', '2134567890'],
                controller: ProfileController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
