import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/sections/alert_dialog_bbl.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/sections/featured_offers_section.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/sections/snap_section.dart';
import 'package:mbanking_mock/bkk_screen/home_screen/widgets/column_app_bar_button.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';
import 'package:mbanking_mock/widgets/bottom_nav_bar.dart';

import '../my_kids_screen/my_kids_screen.dart';
import '../pay_option/pay_option_screen.dart';
import 'controllers/alert_dialog_bbl_controller.dart';
import 'controllers/home_screen_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final foldButton = Image.asset(
    'assets/icons/wave_border_and_fold_button.png',
    height: 30,
  );
  late Image unfoldButton;

  @override
  void initState() {
    super.initState();
    unfoldButton = Image.asset(
      'assets/icons/wave_border_and_unfold_button.png',
      height: 25,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(unfoldButton.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final isAppBarFold = ref.watch(isAppBarFoldProvider);
    final isAlertDialogBBLShown = ref.watch(isAlertDialogBBLShownProvider);

    return Scaffold(
      backgroundColor: ThemeColor.contentBackground,
      appBar: buildAppBar(isAppBarFold),
      bottomNavigationBar: const BottomNavBar(),
      body: Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isAlertDialogBBLShown) const AlertDialogBBL(),
              const SnapSection(),
              const FeaturedOffersSection(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(bool isAppBarFold) => AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                ThemeColor.bblBlueLight,
                ThemeColor.bblBlueDark,
              ],
            ),
          ),
        ),
        leadingWidth: 100,
        leading: Row(
          children: [
            const SizedBox(width: 13.5),
            SizedBox(
              height: 35,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: Image.asset('assets/icons/lock.png'),
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            height: 30,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: Image.asset('assets/icons/quick_check_balance.png'),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 30,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: Image.asset('assets/icons/notification.png'),
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: Size(
            50,
            !isAppBarFold ? 330 : 236,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ThemeColor.bblBlueDark.withOpacity(0.01),
                      ThemeColor.bblBlueDark,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good morning,',
                            style: ThemeText.whiteHeaderEng,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'สมเกียรติ',
                            style: ThemeText.whiteHeaderThai,
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 1),
                              ColumnAppBarButton(
                                'assets/icons/transfer.png',
                                'Transfer',
                                'assets/icons/lifestyle_and_offers.png',
                                'Lifestyle &\nOffers',
                                isAppBarFold,
                                topButtonImageWidth: 70,
                              ),
                              const SizedBox(width: 1),
                              ColumnAppBarButton(
                                'assets/icons/top_up.png',
                                'Top up',
                                'assets/icons/rabbit_line_pay.png',
                                'Rabbit LINE\nPay',
                                isAppBarFold,
                                topButtonImageWidth: 80,
                                bottomButtonImageWidth: 50,
                              ),
                              const SizedBox(width: 1),
                              ColumnAppBarButton(
                                'assets/icons/withdraw_atm.png',
                                'Withdraw\nATM',
                                'assets/icons/pay_bills.png',
                                'Pay Bills\n',
                                isAppBarFold,
                                topButtonImageWidth: 65,
                                bottomButtonOnPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentOption(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 12),
                              ColumnAppBarButton(
                                'assets/icons/scan.png',
                                'Scan',
                                'assets/icons/my_qr.png',
                                'My Kids\n',
                                isAppBarFold,
                                topButtonImageWidth: 48,
                                bottomButtonOnPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyKidsScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                          const SizedBox(height: 35),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                top: null,
                bottom: !isAppBarFold ? -18.6 : -22.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        ref
                            .watch(isAppBarFoldProvider.notifier)
                            .update((state) => !state);
                      },
                      icon: !isAppBarFold ? foldButton : unfoldButton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
