import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odin/Generic/Common/Common_Text.dart';
import 'package:sizer/sizer.dart';

class WellnessComingSoon extends StatefulWidget {
  const WellnessComingSoon({super.key});

  @override
  State<WellnessComingSoon> createState() => _WellnessComingSoonState();
}

class _WellnessComingSoonState extends State<WellnessComingSoon> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Coming Soon",
                style: labelTextStyleBlackReguler19,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  ))
            ],
          ),
          Container(
            height: 25.h,
            width: 25.h,
            child: Image.asset('assets/Images/Coming_Soon.gif'),
          ),
        ],
      ),
    );
  }
}
