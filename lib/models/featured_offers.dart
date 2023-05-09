class FeaturedOffers {
  final String imagePath;

  FeaturedOffers({
    required this.imagePath,
  });

  static final mockFeaturedOffers = [
    FeaturedOffers(
      imagePath: 'assets/images/featured_offers_1.png',
    ),
    FeaturedOffers(
      imagePath: 'assets/images/featured_offers_2.png',
    ),
    FeaturedOffers(
      imagePath: 'assets/images/featured_offers_3.png',
    ),
  ];
}
