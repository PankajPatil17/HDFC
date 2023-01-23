import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonAppBar extends StatefulWidget {
  const CommonAppBar({super.key});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 100.h,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 11.h,
              width: 9.h,
              child: Image.asset(
                "assets/Images/logo.jpg",
                fit: BoxFit.cover,
              )),
          Container(
            alignment: Alignment.center,
            width: 13.h,
            child: Image.asset(
              "assets/Images/name.jpg",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
