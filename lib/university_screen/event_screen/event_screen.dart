import 'package:flutter/material.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/home_screen.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/university_screen/gallery_screen/gallery_screen.dart';
import 'package:mbanking_mock/university_screen/view_grade/view_grade.dart';

import '../home_screen/home.dart';

class Event extends StatelessWidget {
  const Event({super.key});

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
                          'EVENTS',
                          style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 36,
                            color: ThemeColor.cmklBlackText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      height: 320,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Align(
                            //alignt to top left but leave some indent
                            alignment: Alignment(-0.95, 0),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 260,
                                width: 220, //430
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
                                margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 0),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'A Distribute Computing Framework Mini Training',
                                      style: TextStyle(
                                        fontFamily: 'Kanit',
                                        fontSize: 26,
                                        color: ThemeColor.cmklBlackText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Application development intensive',
                                      textAlign: TextAlign.left,

                                      style: TextStyle(
                                        fontFamily: 'Kanit',
                                        fontSize: 15,
                                        color: ThemeColor.cmklBlackText,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 260,
                                width: 160,
                                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.circular(20.0), bottomLeft: Radius.zero, bottomRight: Radius.circular(20.0)), color: ThemeColor.cmklCream),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        'assets/images/kraievent.png',
                                        height: 180,
                                        width: 180,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 20),
                                    const Text(
                                      '9.MAY.2022',
                                      style: TextStyle(
                                        fontFamily: 'Kanit',
                                        fontSize: 28,
                                        color: Color.fromARGB(255, 159, 152, 152),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
  
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/nvidia.png',
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'TECH TALKS 2023\n AIEI x NVIDIA',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 20,
                                color: ThemeColor.cmklBlackText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 5),
                                Text(
                                  '14 Mar 23',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 159, 152, 152),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 3),
                                Text(
                                  ' Efficiently Pre-training &\n Large Language Models\n and Finetuning',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 159, 152, 152),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/eatlab.png',
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'TECH TALKS 2023\n AIEI x EATLAB',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 20,
                                color: ThemeColor.cmklBlackText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 5),
                                Text(
                                  '20 Jan 23',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 159, 152, 152),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(width: 3),
                                Text(
                                  ' Join us for a virtual talk\n on the future of AI Startup',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 159, 152, 152),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
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
                image: 'assets/images/uni_icon_yellow/event.png',
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
