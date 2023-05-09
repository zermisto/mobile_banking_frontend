import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/university_screen/event_screen/event_screen.dart';
import '../../bkk_screen/home_screen/home_screen.dart';
import '../home_screen/home.dart';
import '../view_grade/view_grade.dart';

class StudentGallery extends StatelessWidget {
  const StudentGallery({super.key});

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

                    const Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'GALLERY',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 36,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'Tackling World Crisis through\n Artificial Intelligence',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 22,
                            color: ThemeColor.cmklBlackText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Row(
                      children: [
                        SizedBox(width: 35),
                        Text(
                          '14 December 2022',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: Color.fromARGB(255, 130, 130, 130),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/14dec.png',
                    ),


                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'CMKL Industrial Visit at Microsoft\n Thailand',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 22,
                            color: ThemeColor.cmklBlackText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Row(
                      children: [
                        SizedBox(width: 35),
                        Text(
                          '1 November 2022',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: Color.fromARGB(255, 130, 130, 130),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/images/microsoft.png',
                    ),
                    const SizedBox(height: 30),

                    // your other widgets here
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
                image: 'assets/images/uni_icon_yellow/gallery.png',
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
      ),
    );
  }
}