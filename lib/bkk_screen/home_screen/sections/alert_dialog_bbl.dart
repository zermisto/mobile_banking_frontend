import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';
import 'package:mbanking_mock/widgets/text_button_bbl.dart';

import '../controllers/alert_dialog_bbl_controller.dart';

class AlertDialogBBL extends ConsumerWidget {
  const AlertDialogBBL({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Column(
                children: [
                  const SizedBox(height: 11),
                  Image.asset(
                    'assets/icons/alert.png',
                    width: 22,
                  ),
                ],
              ),
              const Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Beware of scammers! Please review the recipient information to avoid incorrect transaction or scammers.',
                            style: ThemeText.blackContent,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      color: ThemeColor.line1,
                      width: 1.2,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButtonBBL(
                    label: 'Dismiss',
                    onPressed: () {
                      ref
                          .watch(isAlertDialogBBLShownProvider.notifier)
                          .update((state) => !state);
                    },
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
        Container(
          color: ThemeColor.line2,
          width: screenWidth,
          height: 1.2,
        ),
      ],
    );
  }
}
