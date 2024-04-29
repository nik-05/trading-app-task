import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/models/watchlist_model.dart';
import 'package:trading_app/utils/global_constants.dart';
import 'package:trading_app/utils/icon_constants.dart';

class WatchlistTile extends StatelessWidget {
  final WatchlistModel watchlist;
  final VoidCallback onDelete;
  const WatchlistTile({super.key, required this.watchlist, required this.onDelete,});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .20,
        children: [
          SlidableAction(
            onPressed: (context) {
              onDelete.call();
            },
            backgroundColor: GlobalConstants.primaryColor,
            icon: Icons.delete_forever_outlined,
          ),
        ],
      ),
      child: Container(
        color: GlobalConstants.onPrimary,
        height: 52,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.74),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(watchlist.title),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${watchlist.isPositive ? '+' : '-'}${watchlist.pointChange} ', style: GoogleFonts.amaranth(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: watchlist.isPositive ? GlobalConstants.positiveColor : GlobalConstants.negativeColor,
                      )),
                      Text('(+${watchlist.percentageChange}%)', style: GoogleFonts.amaranth(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: GlobalConstants.hintColor,
                      ),),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 56.56,
                  color: GlobalConstants.positiveColor.withOpacity(0.1),
                  child: Center(
                    child: Text(watchlist.bidPrice, style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: GlobalConstants.textPrimary,
                    ),),
                  ),
                ),
                Container(
                  color: GlobalConstants.onPrimary,
                  width: 56.56,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(IconConstants.square, fit: BoxFit.scaleDown,),
                      Text('50', style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        color: GlobalConstants.textPrimary,
                      ),),
                    ],
                  ),
                  ),
                Container(
                  width: 56.56,
                  color: GlobalConstants.negativeColor.withOpacity(0.1),
                  child: Center(
                    child: Text(watchlist.askPrice, style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: GlobalConstants.textPrimary,
                    ),),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
