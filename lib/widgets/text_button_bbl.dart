import 'package:flutter/material.dart';
import 'package:mbanking_mock/shared/theme_color.dart';
import 'package:mbanking_mock/shared/theme_text.dart';

class TextButtonBBL extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final String? imagePath;

  const TextButtonBBL({
    super.key,
    required this.label,
    this.onPressed,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed ?? () {},
        style: TextButton.styleFrom(
          textStyle: ThemeText.blueTextButton,
          foregroundColor: ThemeColor.bblBlueTextButton,
          padding: const EdgeInsets.symmetric(horizontal: 15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            if (imagePath != null)
              Row(
                children: [
                  const SizedBox(width: 7),
                  Image.asset(
                    imagePath!,
                    height: 12,
                  ),
                ],
              ),
          ],
        ),
      );
}
