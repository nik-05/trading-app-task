class ForexModel {
  final String id;
  final String headline;
  final String currentPrice;
  final String changeInPrice;
  final bool isPositive;
  final String percentageChange;

  ForexModel({
    required this.id,
    required this.headline,
    required this.currentPrice,
    required this.changeInPrice,
    required this.isPositive,
    required this.percentageChange,
  });
}
