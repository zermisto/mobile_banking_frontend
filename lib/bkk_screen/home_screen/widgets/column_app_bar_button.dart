import 'package:flutter/material.dart';
import 'package:mbanking_mock/widgets/icon_button_with_title.dart';

class ColumnAppBarButton extends StatelessWidget {
  final String topButtonImagePath;
  final String topButtonTitle;
  final String bottomButtonImagePath;
  final String bottomButtonTitle;
  final double topButtonImageWidth;
  final double bottomButtonImageWidth;
  final bool isAppBarFold;
  final void Function()? topButtonOnPressed;
  final void Function()? bottomButtonOnPressed;

  const ColumnAppBarButton(
    this.topButtonImagePath,
    this.topButtonTitle,
    this.bottomButtonImagePath,
    this.bottomButtonTitle,
    this.isAppBarFold, {
    this.topButtonImageWidth = 40,
    this.bottomButtonImageWidth = 40,
    this.topButtonOnPressed,
    this.bottomButtonOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          IconButtonWithTitle(
            imagePath: topButtonImagePath,
            title: topButtonTitle,
            imageWidth: topButtonImageWidth,
            onPressed: topButtonOnPressed,
          ),
          const SizedBox(height: 20),
          if (!isAppBarFold)
            IconButtonWithTitle(
              imagePath: bottomButtonImagePath,
              title: bottomButtonTitle,
              imageWidth: bottomButtonImageWidth,
              onPressed: bottomButtonOnPressed,
            ),
        ],
      );
}
