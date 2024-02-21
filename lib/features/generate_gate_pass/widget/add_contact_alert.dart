import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:edugated/widget/primary_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void addContactAlert(BuildContext context) {
  TextEditingController controller = TextEditingController();
  showDialog(
    barrierDismissible: true,
    // barrierColor: Colors.white,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (BuildContext context, setState) {
        return AlertDialog(
          backgroundColor: Color(0xff000000B8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(0),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            Container(
              width: 0.9.sw,
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Color(0xffFFFFFF)),
              child: Column(
                children: [
                  Text(
                    "Add Contact",
                    style: TextStyle(
                        color: AppColors.primaryColorDark,
                        fontSize: 22.r,
                        fontWeight: FontWeight.w700),
                  ),
                  ContentField(controller: controller, hintText: "Name"),
                  ContentField(controller: controller, hintText: "Phone"),
                  PrimaryDropDown(
                    labelText: 'Pass Type',
                    hintText: 'Select Pass Type',
                    validator: (txt) {
                      if (txt.toString().isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                    list: ['Family', 'Friend', "Guest"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(value.toString());
                      // genderValue = value;
                    },
                  ),
                  25.verticalSpace,
                  Container(
                    height: 250.h,
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(20.r),
                        dashPattern: [5, 5],
                        color: AppColors.primaryColorDark,
                        strokeWidth: 1,
                        child: controller.text == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Image.asset(
                                      //   "assets/images/Icon material-file-upload@3x.png",
                                      //   scale: 4,
                                      // ),
                                      20.horizontalSpace,
                                      Text(
                                        "Upload Image",
                                        style: TextStyle(
                                          fontFamily: "Roboto, Bold",
                                          fontSize: 16.sp,
                                          color: AppColors.primaryColorDark,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : Container(
                                width: 380.w,
                                height: 121.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Image.file(
                                  File("value.cnicPicture".toString()),
                                  fit: BoxFit.cover,
                                ))),
                  ),
                  25.verticalSpace,
                  PrimaryButton(title: 'Add', onTap: () {}),
                ],
              ),
            ),
          ],
        );
      });
    },
  );
}
