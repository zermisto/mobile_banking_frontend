import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_text.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  final Widget? child;
  final double verticalMargin;

  const ContentHeader({
    super.key,
    required this.title,
    this.child,
    this.verticalMargin = 15,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Text(
                  title,
                  style: ThemeText.blackContentHeader,
                ),
              ],
            ),
            if (child != null) child!,
          ],
        ),
      );
}
