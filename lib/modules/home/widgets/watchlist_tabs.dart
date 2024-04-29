import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/modules/home/widgets/favourite_list.dart';
import 'package:trading_app/utils/global_constants.dart';
import 'package:trading_app/utils/icon_constants.dart';

class WatchlistTabs extends StatelessWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 19.5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 32,
                      width: 262,
                      child: TabBar(
                        labelStyle: GoogleFonts.amaranth(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: GlobalConstants.textPrimary,
                        ),
                        tabs: const [
                          Tab(
                            text: 'Favourites',
                          ),
                          Tab(
                            text: 'WATCHLIST 1',
                          ),
                          Tab(
                            text: 'WATCHLIST 2',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SvgPicture.asset(
                      IconConstants.add,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const FavouriteList(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
