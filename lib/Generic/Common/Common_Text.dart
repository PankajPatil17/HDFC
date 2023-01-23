import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  CommonText({this.label, this.textStyle, this.maxLines});
  final label;
  final textStyle;
  final maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: textStyle,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      overflow: TextOverflow.fade,
    );
  }
}

///ButtonTextSize (White)
const mTextStyleWhite_11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Poppins',
    color: Color(0xFFFFFFFF));

const labelTextStyleGreyReguler11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextFormColor = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xffCDCDCD),
    fontFamily: 'Poppins');

const mTextStyleWhite_13 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Poppins',
    color: Color(0xFFFFFFFF));

const mTextStyleWhite_15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Poppins',
    color: Color(0xFFFFFFFF));

const mTextStyleWhite_17 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    fontFamily: 'Poppins',
    color: Color(0xFFFFFFFF));

///ButtonTextSize (Black)
const mTextStyleBlack_6 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 6,
    fontFamily: 'Poppins',
    color: Color(0xFF333333));

const mTextStyleBlack_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Poppins',
    color: Color(0xFF333333));

const mTextStyleBlack_10 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Poppins',
    color: Color(0xFF707070));

const mTextStyleBlack_13 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Poppins',
    color: Color(0xFF333333));

const mTextStyleBlack_15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Poppins',
    color: Color(0xFF333333));

const mTextStyleBlack_17 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 17,
  fontFamily: 'Poppins',
  // color: Color(0xFF333333),
);

///ButtonTextSize (Blue)
const mTextStyleBlue_5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 5,
    fontFamily: 'Poppins',
    color: Color(0xFF05A6F0));

const mTextStyleBlue_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Poppins',
    color: Color(0xFF05A6F0));

// const mTextStyleBlue_12 = TextStyle(fontWeight: FontWeight.w400, fontSize: 12,fontFamily: 'Poppins',color: Color(0xFF05A6F0));

const mTextStyleBlue_17 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    fontFamily: 'Poppins',
    color: Color(0xFF05A6F0));

///ButtonTextSize (GreyLight)
const mTextStyleGreyLight_11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Poppins',
    color: Color(0xFF9E9E9E));

const mTextStyleGreyLight_15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Poppins',
    color: Color(0xFF9E9E9E));

///ButtonTextSize (GreyMedium)
const mTextStyleGreyMedium_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Poppins',
    color: Color(0xFFB2B2B2));

const mTextStyleGreyMedium_11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Poppins',
    color: Color(0xFFB2B2B2));

///ButtonTextSize (GreyDark)
const mTextStyleGreyDark_8 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 8,
    fontFamily: 'Poppins',
    color: Color(0xFF707070));

const mTextStyleGreyDark_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Poppins',
    color: Color(0xFF707070));

const mTextStyleGreyDark_11 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 11,
  fontFamily: 'Poppins',
  color: Color(0xFF707070),
);
const mTextStyleGreyDark_14 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  fontFamily: 'Poppins',
  color: Color(0xFF707070),
);

const mTextStyleGreyDark_30 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    fontFamily: 'Poppins',
    color: Color(0xFF707070));

///

const labelTextStyleReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');
const labelTextStyleGreyReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xff5E5E5E),
    fontFamily: 'Poppins');
const labelTextStyleRedReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xffFF3C38),
    fontFamily: 'Poppins');

const labelTextStyleMedium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextStyleBold12 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextStyleBlueReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');
const labelTextStyleBlueReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');
const labelTextStyleBlueReguler18 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');
const labelTextStyleBlueMedium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');

const labelTextStyleBlueBold12 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');

const labelTextStyleGreenReguler24 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 25,
    color: Color(0xff52B788),
    fontFamily: 'Poppins');

const labelTextStyleWhiteReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleWhiteMedium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleWhiteBold12 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: Colors.white,
    fontFamily: 'Poppins');
const labelTextStyleBlackReguler11 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 10, fontFamily: 'Poppins');

const labelTextStyleBlackReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Poppins',
    color: Colors.black);
const labelTextStyleGreenReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Poppins',
    color: Color(0xff74C69D));

const labelTextStyleBlackMedium12 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 11, fontFamily: 'Poppins');

const labelTextStyleBlackBold12 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 11, fontFamily: 'Poppins');

const labelTextStyleReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextStyleWhiteReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleWhiteMedium14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Poppins');
const labelTextStyleWhiteMedium15 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleWhiteBold14 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleBlackReguler14 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 13, fontFamily: 'Poppins');

const labelTextStyleBlackReguler16 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Poppins');

const labelTextStyleBlackMedium16 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'Poppins');

const labelTextStyleREdReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Poppins',
    color: Colors.red);

const labelTextStyleBlackMedium14 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 13, fontFamily: 'Poppins');

const labelTextStyleBlackBold14 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 13, fontFamily: 'Poppins');

const labelTextStyleMedium16 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'Poppins');

const labelTextStyleMedium14 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 13, fontFamily: 'Poppins');

const labelTextStyleReguler16 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Poppins');

const labelTextStyleReguler20 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 20, fontFamily: 'Poppins');

const labelTextStyleBold16 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 15, fontFamily: 'Poppins');

const labelTextStyleGreyReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');
const labelTextStyleGreyReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextStyleGreyMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextStyleGreyBold16 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Color(0xFF707070),
    fontFamily: 'Poppins');

const labelTextStyleWhiteReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Poppins');
const labelTextStyleWhiteReguler19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'Poppins');
const labelTextStyleWhiteReguler25 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleWhiteMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleWhiteBold16 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Poppins');

const labelTextStyleBlueReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');

const labelTextStyleGreenReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xff52B788),
    fontFamily: 'Poppins');

const labelTextStyleGreenReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xff52B788),
    fontFamily: 'Poppins');
const labelTextStyleDarkBlueReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xff338EC0),
    fontFamily: 'Poppins');
const labelTextStyleGreenReguler20 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 19,
    color: Color(0xff52B788),
    fontFamily: 'Poppins');

const labelTextStyleBlueMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');

const labelTextStyleBlueBold16 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Color(0xff2479AB),
    fontFamily: 'Poppins');

const labelTextStyleReguler19 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 18, fontFamily: 'Poppins');
const labelTextStyleBlackReguler19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Poppins',
    color: Color(0xff333333));

const labelTextStyleMedium19 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 18, fontFamily: 'Poppins');

const labelTextStyleBold19 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Poppins');

const labelTextStyleFontGreyReguler19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Poppins',
    color: Color(0xffb2b2b2));

const labelTextStyleFontGreyMedium19 = TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xFF707070),
    fontSize: 18,
    fontFamily: 'Poppins');

const labelTextStyleFontGreyBold19 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Poppins');

const labelTextStyle26 =
    TextStyle(fontSize: 26, fontWeight: FontWeight.w600, fontFamily: 'Poppins');

const labelTextStyle32 =
    TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Poppins');



//const labelTestStyleFontFamily = TextStyle(fontSize:40,color: Colors.grey,fontWeight: FontWeight.w100,fontFamily: "Bauhaus");