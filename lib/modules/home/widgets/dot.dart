import 'package:flutter/material.dart';
import 'package:trading_app/utils/global_constants.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: GlobalConstants.dividerColor,
      ),
    );
  }
}
