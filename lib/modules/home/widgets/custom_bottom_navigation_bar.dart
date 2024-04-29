import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app/utils/global_constants.dart';
import 'package:trading_app/utils/icon_constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  CustomBottomNavigationBar(this.selectedIndex, {super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: GlobalConstants.onPrimary,
      elevation: 32,
      currentIndex: widget.selectedIndex,
      iconSize: 25,
      enableFeedback: true,
      onTap: (index) {
        setState(() {
          widget.selectedIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconConstants.home,
            fit: BoxFit.scaleDown,
            colorFilter: widget.selectedIndex == 0 ? const ColorFilter.mode(
              GlobalConstants.primaryColor,
              BlendMode.srcIn,
            ) : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconConstants.chart,
            fit: BoxFit.scaleDown,
            colorFilter: widget.selectedIndex == 1 ? const ColorFilter.mode(
              GlobalConstants.primaryColor,
              BlendMode.srcIn,
            ) : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconConstants.order,
            fit: BoxFit.scaleDown,
            colorFilter: widget.selectedIndex == 2 ? const ColorFilter.mode(
              GlobalConstants.primaryColor,
              BlendMode.srcIn,
            ) : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconConstants.market,
            fit: BoxFit.scaleDown,
            colorFilter: widget.selectedIndex == 3 ? const ColorFilter.mode(
              GlobalConstants.primaryColor,
              BlendMode.srcIn,
            ) : null,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            IconConstants.profile,
            fit: BoxFit.scaleDown,
            colorFilter: widget.selectedIndex == 4 ? const ColorFilter.mode(
              GlobalConstants.primaryColor,
              BlendMode.srcIn,
            ) : null,
          ),
          label: '',
        ),
      ],
    );
  }
}
