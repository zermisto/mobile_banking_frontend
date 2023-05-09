import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_text.dart';

class IconButtonWithTitle extends StatelessWidget {
  final void Function()? onPressed;
  final String imagePath;
  final String title;
  final double imageWidth;

  const IconButtonWithTitle({
    super.key,
    this.onPressed,
    required this.imagePath,
    this.title = '',
    this.imageWidth = 35,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onPressed ?? () {},
      icon: Column(
        children: [
          SizedBox(
            height: 50,
            child: Image.asset(
              imagePath,
              width: imageWidth,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: ThemeText.whiteContent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
