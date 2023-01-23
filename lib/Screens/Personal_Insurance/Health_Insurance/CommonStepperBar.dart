import 'package:hdfc_bank/Generic/Common/CommonTextNunito.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonStepperBar extends StatefulWidget {
  final pageNum;

  const CommonStepperBar({super.key, required this.pageNum});

  @override
  State<CommonStepperBar> createState() => _CommonStepperBarState();
}

class _CommonStepperBarState extends State<CommonStepperBar> {
  @override
  Widget build(BuildContext context) {
    //
    return Row(
      children: [
        commonRoundContainer(
            pageNum: '1',
            pageColor: widget.pageNum >= 1 ? Color(0xff25D18E) : Colors.white,
            pageNumColor: widget.pageNum >= 1 ? Colors.white : Colors.black),
        Expanded(
            child: Container(
          height: 0.5,
          color: Colors.grey,
        )),
        commonRoundContainer(
            pageNum: '2',
            pageColor: widget.pageNum >= 2 ? Color(0xff25D18E) : Colors.white,
            pageNumColor: widget.pageNum >= 2 ? Colors.white : Colors.black),
        Expanded(
          child: Container(
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        commonRoundContainer(
            pageNum: '3',
            pageColor: widget.pageNum >= 3 ? Color(0xff25D18E) : Colors.white,
            pageNumColor: widget.pageNum >= 3 ? Colors.white : Colors.black),
        Expanded(
          child: Container(
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        commonRoundContainer(
            pageNum: '4',
            pageColor: widget.pageNum >= 4 ? Color(0xff25D18E) : Colors.white,
            pageNumColor: widget.pageNum >= 4 ? Colors.white : Colors.black)
      ],
    );
  }

  commonRoundContainer({pageNum, pageColor, pageNumColor}) {
    return Container(
      height: 5.h,
      width: 5.h,
      decoration: BoxDecoration(
          color: pageColor,
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xff25D18E))),
      child: Center(
        child: CommonTextNunito(
          label: pageNum.toString(),
          fontw8: FontWeight.w600,
          colorT: pageNumColor,
          size: 13.sp,
        ),
      ),
    );
  }
}
