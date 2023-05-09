import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_color.dart';

import '../../university_screen/home_screen/home.dart';
import '../home_screen/home_screen.dart';
import '../pay_option/pay_option_screen.dart';
import '../succesful_payment_screen/successful_payment_screen.dart';

class StudentGallery2 extends StatelessWidget {
  const StudentGallery2({super.key});

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
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            actions: [
              buildIconButton(
                image: 'assets/images/cmkl_logo.png',
                context: context,
                screen: const HomeScreen(),
                heights: 75,
                widths: 75,
              ),
            ]),
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
                image: 'assets/images/home.png',
                context: context,
                screen: const HomeUni(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/gallery.png',
                context: context,
                screen: const PaymentOption(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/grade.png',
                context: context,
                screen: const PaymentSuccssfulScreen(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/event.png',
                context: context,
                screen: const HomeScreen(),
                heights: 75,
                widths: 75,
              ),
              buildIconButton(
                image: 'assets/images/more.png',
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
