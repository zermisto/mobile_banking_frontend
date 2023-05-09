
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/home_screen.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/controllers/profile_controller.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/university_screen/event_screen/event_screen.dart';
import 'package:mbanking_mock/university_screen/gallery_screen/gallery_screen.dart';
import '../../shared/theme_text.dart';
import '../home_screen/home.dart';

final controller = ProfileController();

class ViewGrade extends StatelessWidget {
  const ViewGrade({super.key});

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
            return const Text(
              '',
              style: TextStyle(
                fontSize: 20,
              ),
            );
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
            return const Text(
              '',
              style: TextStyle(
                fontSize: 16,
              ),
            );
          }
        },
      );

  Row futureGPA({
    required String studentId,
    required ProfileController controller,
  }) =>
      Row(
        children: [
          FutureBuilder(
            future: controller.getStudentGPA(studentId: studentId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String gpa = snapshot.data as String;
                return Text(
                  gpa,
                  style: ThemeText.cmklGrade,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const Text(
                  '',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                );
              }
            },
          ),
        ],
      );

  ///make fucntin to make continaer
  ///
  Widget buildContainer({
    required String year,
    required String semester,
    required String semester2,
    required String gpa,
    required String gpa2,
    required String gpa3,
    required BuildContext context,
  }) =>
      Container(
          height: 150,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeColor.cmklGreyLight),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: ThemeText.cmklBlackSubHeader,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    semester,
                    style: ThemeText.cmklBlackHome2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    semester2,
                    style: ThemeText.cmklBlackHome2,
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    gpa,
                    style: ThemeText.cmklBlackSubHeader,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    gpa2,
                    style: ThemeText.cmklBlackSubLine2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    gpa3,
                    style: ThemeText.cmklBlackSubLine2,
                  ),
                ],
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_cmkl.png',
                fit: BoxFit.cover,
              ),
            ),

            // content
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // heading
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(width: 255),
                          buildIconButton(
                            image: 'assets/images/cmkl_logo.png',
                            context: context,
                            screen: const HomeScreen(),
                            heights: 75,
                            widths: 75,
                          ),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        const Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              'VIEW GRADE',
                              style: ThemeText.cmklTitle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: 180,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: DottedLine(
                                      dashColor:
                                          ThemeColor.cmklBlack.withOpacity(0.5),
                                      lineLength: 160,
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  futureFirstName(
                                    studentId: '2134567890',
                                    controller: controller,
                                  ),
                                  const SizedBox(height: 10),
                                  FutureLastName(
                                    studentId: '2134567890',
                                    controller: controller,
                                  ),
                                  const SizedBox(height: 15),
                                  futureGPA(
                                    studentId: '2134567890',
                                    controller: controller,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'GPAX',
                                    style: ThemeText.cmklRedSubLine,
                                  ),
                                ],
                              ),
                            ),
                            const CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage('assets/images/krittin.png'),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        const SizedBox(height: 100),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 300,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  buildContainer(
                                    year: 'Year 2',
                                    semester: 'Fall semester 2',
                                    semester2: 'Spring semester 22',
                                    gpa: '3.58',
                                    gpa2: '3.60',
                                    gpa3: '3.56',
                                    context: context,
                                  ),
                                  buildContainer(
                                    year: 'Year 1',
                                    semester: 'Fall semester 2',
                                    semester2: 'Spring semester 21',
                                    gpa: '3.56',
                                    gpa2: '3.58',
                                    gpa3: '3.54',
                                    context: context,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: ThemeColor.cmklRed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildIconButton(
                image: 'assets/images/uni_icon/home.png',
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
                image: 'assets/images/uni_icon_yellow/grade.png',
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
      ),
    );
  }
}
