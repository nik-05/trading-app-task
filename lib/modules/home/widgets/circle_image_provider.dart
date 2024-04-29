import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/utils/global_constants.dart';

class CircleImageProvider extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final String text;

  const CircleImageProvider(
      {super.key,
      this.imageUrl,
      this.height = 18,
      this.width = 18,
      this.text = '100'});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GlobalConstants.primaryColor,
          image: imageUrl == null
              ? null
              : DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.fill,
                )),
      child: imageUrl == null
          ? Center(
              child: Text(
                text,
                style: GoogleFonts.adventPro(
                  color: GlobalConstants.onPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 7,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
