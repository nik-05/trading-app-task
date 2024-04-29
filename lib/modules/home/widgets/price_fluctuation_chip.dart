import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/models/forex_model.dart';
import 'package:trading_app/modules/home/widgets/circle_image_provider.dart';
import 'package:trading_app/modules/home/widgets/dot.dart';
import 'package:trading_app/utils/global_constants.dart';

class PriceFluctuationChip extends StatelessWidget {
  final ForexModel forexModel;

  const PriceFluctuationChip({super.key, required this.forexModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleImageProvider(),
              const SizedBox(width: 5),
              Text(
                forexModel.headline,
                style: GoogleFonts.adventPro(
                  fontWeight: FontWeight.w700,
                  fontSize: 9,
                  color: GlobalConstants.textPrimary,
                ),
              ),
              const SizedBox(width: 6),
              const Dot(),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            forexModel.currentPrice,
            style: GoogleFonts.adventPro(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: GlobalConstants.textPrimary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '-${forexModel.changeInPrice} (-${forexModel.percentageChange}%)',
            style: GoogleFonts.adventPro(
              fontWeight: FontWeight.w700,
              fontSize: 7,
              color: forexModel.isPositive ? GlobalConstants.positiveColor : GlobalConstants.negativeColor,
            ),
          )
        ],
      ),
    );
  }
}
