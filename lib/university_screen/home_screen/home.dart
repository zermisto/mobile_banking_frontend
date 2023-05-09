import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mbanking_mock/university_screen/event_screen/event_screen.dart';
import 'package:mbanking_mock/university_screen/fee_detail_screen/fee_detail_screen.dart';
import 'package:mbanking_mock/university_screen/gallery_screen/gallery_screen.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/controllers/profile_controller.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/home_screen.dart';
import 'package:mbanking_mock/bkk_screen/pay_option/pay_option_screen.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';
import 'package:mbanking_mock/university_screen/view_grade/view_grade.dart';

class HomeUni extends StatelessWidget {
  const HomeUni({super.key});

  Widget buildIconButton({
    required String image,
    required Widget screen,
    required BuildContext context,
    required double heights,
    required double widths,
  }) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return screen;
              },
            ),
          );
        },
        child: Image(
          image: AssetImage(image),
          height: heights,
          width: widths,
        ),
      );

  //make function to call FutureBuilder and return String
  FutureBuilder<String?> futureFirstName({
    required String studentId,
    required ProfileController controller,
  }) =>
      FutureBuilder(
        future: controller.getStudentFirstName(studentId: studentId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String firstName = snapshot.data as String;
            return Text(
              firstName,
              style: ThemeText.cmklBlackHome,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      );

  // ignore: non_constant_identifier_names
  FutureBuilder<String?> FutureLastName({
    required String studentId,
    required ProfileController controller,
  }) =>
      FutureBuilder(
        future: controller.getStudentLastName(studentId: studentId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String lastName = snapshot.data as String;
            return Text(
              lastName,
              style: ThemeText.cmklBlackSubLine,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Text('');
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
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String data = snapshot.data as String;
              return Text(
                "$successText: $data",
                style: ThemeText.cmklBlackSubLine,
              );
            } else if (snapshot.hasError) {
              return Text('$errorText: ${snapshot.error}');
            } else {
              return const Text('');
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //String userName = 'v';

    final controller = ProfileController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          titleTextStyle: ThemeText.cmklBlackHeader,
          foregroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
          actions: [
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
          ],
          toolbarHeight: 70,
        ),
        bottomNavigationBar: BottomAppBar(
          color: ThemeColor.cmklRed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconButton(
                image: 'assets/images/uni_icon_yellow/home.png',
                context: context,
                screen: const HomeUni(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/uni_icon/gallery.png',
                context: context,
                screen: const StudentGallery(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/uni_icon/grade.png',
                context: context,
                screen: const ViewGrade(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/uni_icon/event.png',
                context: context,
                screen: const Event(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/uni_icon/more.png',
                context: context,
                screen: const HomeScreen(),
                heights: 75,
                widths: 75,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: 150,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                child: Container(
                  height: 150,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/krittin.png'),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          futureFirstName(
                            studentId: '2134567890',
                            controller: controller,
                          ),
                          const SizedBox(height: 5),
                          FutureLastName(
                            studentId: '2134567890',
                            controller: controller,
                          ),
                          const SizedBox(height: 10),
                          buildFutureText(
                            future: controller.getStudentEmail(
                                studentId: '2134567890'),
                            successText: 'Email',
                            errorText: 'Failed to fetch Email',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DottedLine(
                dashColor: ThemeColor.cmklBlack.withOpacity(0.5),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: 150,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TUITION FEE',
                              style: ThemeText.cmklBlackHome,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '285,000 Baht',
                              style: ThemeText.cmklBlackHome2,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Due tomorrow',
                              style: ThemeText.cmklRedSubLine,
                            ),
                          ],
                        ),
                        const SizedBox(width: 117),
                        Column(
                          children: [
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
                                      builder: (context) =>
                                          const PaymentOption()),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FeeDetail()),
                                );
                              },
                              child: const Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'View details',
                                    style: ThemeText.cmklBlackHome2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DottedLine(
                dashColor: ThemeColor.cmklBlack.withOpacity(0.5),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: 270,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 250,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeColor.cmklGreyLight),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(10),
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'NEWS',
                              style: ThemeText.cmklBlackSubHeader,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Dual Bacheror’s Degree  Program KMITL x CMKL Admission B.Eng in Computer Innovation Engineering',
                            style: ThemeText.cmklBlackSubLine2,
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Read more',
                              style: ThemeText.cmklBlackHome2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeColor.cmklGreyLight),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      child: const Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'GPA',
                              style: ThemeText.cmklBlackSubHeader,
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '3.60',
                              style: ThemeText.cmklBlackSubLine2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Fall semester 22',
                              style: ThemeText.cmklBlackHome2,
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '3.57',
                              style: ThemeText.cmklBlackSubLine2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Cumulative',
                              style: ThemeText.cmklBlackHome2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: 240,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Align(
                      //alignt to top left but leave some indent
                      alignment: Alignment(-0.95, 0),
                      child: Text(
                        'EVENT',
                        style: ThemeText.cmklBlackSubHeader,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 180,
                          width: 280, //430
                          decoration: const BoxDecoration(
                            color: ThemeColor.cmklCream,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.zero,
                            ),
                          ),
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'A Distribute Computing\nFramework',
                                style: ThemeText.cmklBlackSubHeader,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Mini Training',
                                style: ThemeText.cmklBlackSubLine2,
                              ),
                              SizedBox(height: 20),
                              Text(
                                '9 May 2023',
                                style: ThemeText.cmklBlackHome2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 100, //430
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero),
                              color: ThemeColor.cmklCream),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/piKrai.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
