import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 10,
      unselectedFontSize: 10,
      backgroundColor: Colors.white,
      selectedItemColor: ThemeColor.bblBlue,
      unselectedItemColor: ThemeColor.grayContent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {},
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home.png',
            width: 25,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/accounts.png',
            width: 30,
          ),
          label: 'Accounts',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/banking.png',
            width: 25,
          ),
          label: 'Banking',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/investments.png',
            width: 25,
          ),
          label: 'Investments',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/more.png',
            width: 25,
          ),
          label: 'More',
        ),
      ],
    );
  }
}
