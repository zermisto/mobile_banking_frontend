import 'package:flutter/material.dart';
import 'package:mbanking_mock/models/snap.dart';
import 'package:mbanking_mock/widgets/content_header.dart';
import 'package:mbanking_mock/widgets/text_button_bbl.dart';

class SnapSection extends StatelessWidget {
  const SnapSection({super.key});

  @override
  Widget build(BuildContext context) => ContentHeader(
        title: 'Snap',
        child: Column(
          children: [
            const SizedBox(height: 5),
            SizedBox(
              height: 185,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                itemBuilder: (_, int index) => Image.asset(
                  Snap.mockSnaps[index].imagePath,
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  width: 7,
                ),
                itemCount: Snap.mockSnaps.length,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtonBBL(
                  label: 'See all',
                  imagePath: 'assets/icons/next.png',
                ),
              ],
            ),
          ],
        ),
      );
}
