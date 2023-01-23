import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextNunito extends StatelessWidget {
  final size;
  final label;
  final fontw8;
  final overflow;
  final maxline;
  final colorT;

  const CommonTextNunito(
      {super.key,
      this.size,
      this.label,
      this.overflow,
      this.maxline,
      this.fontw8,
      this.colorT});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        color: colorT,
        fontSize: size,
        fontWeight: fontw8,
      ),
      maxLines: maxline,
      overflow: overflow,
    );
  }
}
