import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import '../../bkk_screen/home_screen/home_screen.dart';
import '../event_screen/event_screen.dart';
import '../gallery_screen/gallery_screen.dart';
import '../home_screen/home.dart';
import '../view_grade/view_grade.dart';

class FeeDetail extends StatelessWidget {
  const FeeDetail({super.key});

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

  Widget buildGallery({
    required String title,
    required String date,
    required String image,
    required BuildContext context,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 30),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 22,
                  color: ThemeColor.cmklBlackText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(width: 35),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 20,
                  color: Color.fromARGB(255, 130, 130, 130),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 30),
              Image.asset(
                image,
              ),
            ],
          ),
        ],
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
                          'FEE DETAILS',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 30,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'Tuition fees',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 150),
                        Text(
                          '250,000.00',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'University fees',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 135),
                        Text(
                          '35,000.00',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 210),
                        Text(
                          '285,000.00',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 20,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w500,
                          ),
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
