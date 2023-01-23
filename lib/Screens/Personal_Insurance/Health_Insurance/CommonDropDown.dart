import 'package:hdfc_bank/Controller/PersonalHealthInsurerController.dart';
import 'package:hdfc_bank/Generic/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonDropDown extends StatefulWidget {
  final headTitle;

  const CommonDropDown({super.key, required this.headTitle});

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  var HealthInsurerController = Get.put(PersonalHealthInsurerController());
  String? Age;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.4.h),
      decoration: BoxDecoration(
          color: pWhite,
          boxShadow: commonboxshadowBlue,
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: DropdownButton(
          iconSize: 4.h,
          iconEnabledColor: Color(0xff4BC4F9),
          iconDisabledColor: Color(0xff4BC4F9),
          underline: Container(
            color: pWhite,
          ),
          focusColor: Colors.white,
          menuMaxHeight: 300.0,
          isExpanded: true,
          isDense: true,
          hint: Text(
            "${widget.headTitle} age",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
                overflow: TextOverflow.ellipsis),
          ),
          value: Age,
          items: widget.headTitle == 'Self'
              ? HealthInsurerController.AgeList.getRange(18, 101).map((item) {
                  return DropdownMenuItem(
                      onTap: () {
                        HealthInsurerController.FinalNameWithAge.removeWhere(
                            (e) {
                          return e['name'] == widget.headTitle.toString();
                        });
                      },
                      enabled: true,
                      value: item.toString(),
                      child: Text(
                        item,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            overflow: TextOverflow.ellipsis),
                      ));
                }).toList()
              : widget.headTitle == 'Spouse'
                  ? HealthInsurerController.AgeList.getRange(18, 101)
                      .map((item) {
                      return DropdownMenuItem(
                          onTap: () {
                            HealthInsurerController.FinalNameWithAge
                                .removeWhere((e) {
                              return e['name'] == widget.headTitle.toString();
                            });
                          },
                          enabled: true,
                          value: item.toString(),
                          child: Text(
                            item,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                overflow: TextOverflow.ellipsis),
                          ));
                    }).toList()
                  : widget.headTitle.contains('Son')
                      ? HealthInsurerController.AgeList.getRange(0, 31)
                          .map((item) {
                          return DropdownMenuItem(
                              onTap: () {
                                HealthInsurerController.FinalNameWithAge
                                    .removeWhere((e) {
                                  return e['name'] ==
                                      widget.headTitle.toString();
                                });
                              },
                              enabled: true,
                              value: item.toString(),
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    overflow: TextOverflow.ellipsis),
                              ));
                        }).toList()
                      : widget.headTitle.contains('Daughter')
                          ? HealthInsurerController.AgeList.getRange(0, 31)
                              .map((item) {
                              return DropdownMenuItem(
                                  onTap: () {
                                    HealthInsurerController.FinalNameWithAge
                                        .removeWhere((e) {
                                      return e['name'] ==
                                          widget.headTitle.toString();
                                    });
                                  },
                                  enabled: true,
                                  value: item.toString(),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        overflow: TextOverflow.ellipsis),
                                  ));
                            }).toList()
                          : HealthInsurerController.AgeList.getRange(40, 101)
                              .map((item) {
                              return DropdownMenuItem(
                                  onTap: () {
                                    HealthInsurerController.FinalNameWithAge
                                        .removeWhere((e) {
                                      return e['name'] ==
                                          widget.headTitle.toString();
                                    });
                                  },
                                  enabled: true,
                                  value: item.toString(),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                        overflow: TextOverflow.ellipsis),
                                  ));
                            }).toList(),
          onChanged: (value) {
            setState(() {
              Age = value;
              HealthInsurerController.FinalNameWithAge.add(
                  {"name": widget.headTitle.toString(), "age": value});
            });
          },
        ),
      ),
    );
  }
}
