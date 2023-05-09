import 'package:flutter/material.dart';
import 'package:mbanking_mock/models/featured_offers.dart';
import 'package:mbanking_mock/widgets/content_header.dart';

class FeaturedOffersSection extends StatelessWidget {
  const FeaturedOffersSection({super.key});

  @override
  Widget build(BuildContext context) => ContentHeader(
        title: 'Featured offers',
        verticalMargin: 5,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                itemBuilder: (_, int index) => Image.asset(
                  FeaturedOffers.mockFeaturedOffers[index].imagePath,
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  width: 10,
                ),
                itemCount: FeaturedOffers.mockFeaturedOffers.length,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      );
}
