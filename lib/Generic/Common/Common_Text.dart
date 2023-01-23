import 'package:flutter/material.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';

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
    fontFamily: 'Inter',
    color: Color(0xFFFFFFFF));

const labelTextStyleGreyReguler11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextFormColor = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xffCDCDCD),
    fontFamily: 'Inter');

const mTextStyleWhite_13 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Inter',
    color: Color(0xFFFFFFFF));

const mTextStyleWhite_15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Inter',
    color: Color(0xFFFFFFFF));

const mTextStyleWhite_17 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    fontFamily: 'Inter',
    color: Color(0xFFFFFFFF));

///ButtonTextSize (Black)
const mTextStyleBlack_6 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 6,
    fontFamily: 'Inter',
    color: Color(0xFF333333));

const mTextStyleBlack_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Inter',
    color: Color(0xFF333333));

const mTextStyleBlack_10 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Inter',
    color: Color(0xFF707070));

const mTextStyleBlack_13 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Inter',
    color: Color(0xFF333333));

const mTextStyleBlack_15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Inter',
    color: Color(0xFF333333));

const mTextStyleBlack_17 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 17,
  fontFamily: 'Inter',
  // color: Color(0xFF333333),
);

///ButtonTextSize (Blue)
const mTextStyleBlue_5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 5,
    fontFamily: 'Inter',
    color: Color(0xFF05A6F0));

const mTextStyleBlue_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Inter',
    color: Color(0xFF05A6F0));

// const mTextStyleBlue_12 = TextStyle(fontWeight: FontWeight.w400, fontSize: 12,fontFamily: 'Inter',color: Color(0xFF05A6F0));

const mTextStyleBlue_17 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    fontFamily: 'Inter',
    color: Color(0xFF05A6F0));

///ButtonTextSize (GreyLight)
const mTextStyleGreyLight_11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Inter',
    color: Color(0xFF9E9E9E));

const mTextStyleGreyLight_15 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Inter',
    color: Color(0xFF9E9E9E));

///ButtonTextSize (GreyMedium)
const mTextStyleGreyMedium_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Inter',
    color: Color(0xFFB2B2B2));

const mTextStyleGreyMedium_11 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Inter',
    color: Color(0xFFB2B2B2));

///ButtonTextSize (GreyDark)
const mTextStyleGreyDark_8 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 8,
    fontFamily: 'Inter',
    color: Color(0xFF707070));

const mTextStyleGreyDark_9 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    fontFamily: 'Inter',
    color: Color(0xFF707070));

const mTextStyleGreyDark_11 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 11,
  fontFamily: 'Inter',
  color: Color(0xFF707070),
);
const mTextStyleGreyDark_14 = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  fontFamily: 'Inter',
  color: Color(0xFF707070),
);

const mTextStyleGreyDark_30 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    fontFamily: 'Inter',
    color: Color(0xFF707070));

///

const labelTextStyleReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Inter');
const labelTextStyleGreyReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xff5E5E5E),
    fontFamily: 'Inter');
const labelTextStyleRedReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xffFF3C38),
    fontFamily: 'Inter');

const labelTextStyleMedium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextStyleBold12 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextStyleBlueReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');
const labelTextStyleBlueReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');
const labelTextStyleBlueReguler18 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');
const labelTextStyleBlueMedium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');

const labelTextStyleBlueBold12 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');

const labelTextStyleGreenReguler24 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 25,
    color: Color(0xff52B788),
    fontFamily: 'Inter');

const labelTextStyleWhiteReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleWhiteMedium12 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleWhiteBold12 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: Colors.white,
    fontFamily: 'Inter');
const labelTextStyleBlackReguler11 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 10, fontFamily: 'Inter');

const labelTextStyleBlackReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: 'Inter',
    color: Colors.black);
const labelTextStyleGreenReguler12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'Inter',
    color: Color(0xff74C69D));

const labelTextStyleBlackMedium12 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 11, fontFamily: 'Inter');

const labelTextStyleBlackBold12 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 11, fontFamily: 'Inter');

const labelTextStyleReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextStyleWhiteReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleWhiteMedium14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Inter');
const labelTextStyleWhiteMedium15 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleWhiteBold14 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleBlackReguler14 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 13, fontFamily: 'Inter');

const labelTextStyleBlackReguler16 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Inter');

const labelTextStyleBlackMedium16 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'Inter');

const labelTextStyleREdReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Inter',
    color: Colors.red);

const labelTextStyleBlackMedium14 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 13, fontFamily: 'Inter');

const labelTextStyleBlackBold14 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 13, fontFamily: 'Inter');

const labelTextStyleMedium16 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'Inter');

const labelTextStyleMedium14 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 13, fontFamily: 'Inter');

const labelTextStyleReguler16 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Inter');

const labelTextStyleReguler20 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 20, fontFamily: 'Inter');

const labelTextStyleBold16 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 15, fontFamily: 'Inter');

const labelTextStyleGreyReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xFF707070),
    fontFamily: 'Inter');
const labelTextStyleGreyReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextStyleGreyMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextStyleGreyBold16 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Color(0xFF707070),
    fontFamily: 'Inter');

const labelTextStyleWhiteReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Inter');
const labelTextStyleWhiteReguler19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'Inter');
const labelTextStyleWhiteReguler25 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleWhiteMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleWhiteBold16 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Inter');

const labelTextStyleBlueReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');

const labelTextStyleGreenReguler16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: Color(0xff52B788),
    fontFamily: 'Inter');

const labelTextStyleGreenReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xff52B788),
    fontFamily: 'Inter');
const labelTextStyleDarkBlueReguler14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: mainBlue,
    fontFamily: 'Inter');
const labelTextStyleGreenReguler20 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 19,
    color: Color(0xff52B788),
    fontFamily: 'Inter');

const labelTextStyleBlueMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');

const labelTextStyleBlueBold16 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Color(0xff2479AB),
    fontFamily: 'Inter');

const labelTextStyleReguler19 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 18, fontFamily: 'Inter');
const labelTextStyleBlackReguler19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Inter',
    color: Color(0xff333333));

const labelTextStyleMedium19 =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 18, fontFamily: 'Inter');

const labelTextStyleBold19 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Inter');

const labelTextStyleFontGreyReguler19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Inter',
    color: Color(0xffb2b2b2));

const labelTextStyleFontGreyMedium19 = TextStyle(
    fontWeight: FontWeight.w500,
    color: Color(0xFF707070),
    fontSize: 18,
    fontFamily: 'Inter');

const labelTextStyleFontGreyBold19 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Inter');

const labelTextStyle26 =
    TextStyle(fontSize: 26, fontWeight: FontWeight.w600, fontFamily: 'Inter');

const labelTextStyle32 =
    TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Inter');



//const labelTestStyleFontFamily = TextStyle(fontSize:40,color: Colors.grey,fontWeight: FontWeight.w100,fontFamily: "Bauhaus");