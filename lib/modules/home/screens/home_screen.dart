import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/modules/home/services/forex_data.dart';
import 'package:trading_app/modules/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:trading_app/modules/home/widgets/price_fluctuation_chip.dart';
import 'package:trading_app/modules/home/widgets/watchlist_tabs.dart';
import 'package:trading_app/modules/home/widgets/welcome_card.dart';
import 'package:trading_app/utils/global_constants.dart';
import 'package:trading_app/utils/icon_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalConstants.scaffoldColor,
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: GlobalConstants.onPrimary,
        title: const Text('Quotes'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(IconConstants.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Drawer(),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: WelcomeCard(name: 'Agilan'),
          ),
          // Forex View.
          Container(
            height: 70,
            color: GlobalConstants.onPrimary,
            child: ListView.separated(
              separatorBuilder: (context, index) => const VerticalDivider(
                indent: 10,
                endIndent: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: forexData.length,
              itemBuilder: (context, index) {
                return PriceFluctuationChip(forexModel: forexData[index]);
              },
            ),
          ),
          const SizedBox(height: 5),
          const Expanded(child: WatchlistTabs()),
        ],
      ),
    );
  }
}
