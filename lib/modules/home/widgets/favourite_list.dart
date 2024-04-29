import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/modules/home/services/watchlist_data.dart';
import 'package:trading_app/modules/home/widgets/watchlist_tile.dart';
import 'package:trading_app/utils/global_constants.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17.76),
          height: 41,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Script',
                style: GoogleFonts.amaranth(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: GlobalConstants.hintColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Bid',
                    style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: GlobalConstants.hintColor,
                    ),
                  ),
                  const SizedBox(width: 90),
                  Text(
                    'Ask',
                    style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: GlobalConstants.hintColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: watchlistData.length,
            itemBuilder: (context, index) {
              return WatchlistTile(watchlist: watchlistData[index], onDelete: () {
                watchlistData.removeAt(index);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Item removed from favourites'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },);
            },
          ),
        ),
      ],
    );
  }
}
