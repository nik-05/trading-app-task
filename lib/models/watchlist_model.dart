
class WatchlistModel {
  final String id;
  final String title;
  final String percentageChange;
  final String pointChange;
  final bool isPositive;
  final String bidPrice;
  final String askPrice;

  WatchlistModel({
    required this.id,
    required this.title,
    required this.percentageChange,
    required this.pointChange,
    required this.isPositive,
    required this.bidPrice,
    required this.askPrice,
  });
}
