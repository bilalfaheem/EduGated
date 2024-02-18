import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'generate_gate_pass_cubit.dart';
import 'generate_gate_pass_state.dart';

class GenerateGatePassPage extends StatefulWidget {
  final GenerateGatePassCubit cubit;

  const GenerateGatePassPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<GenerateGatePassPage> createState() => _GenerateGatePassState();
}

class _GenerateGatePassState extends State<GenerateGatePassPage> {
  GenerateGatePassCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Image.asset(
                    AppAssets.logo,
                    height: 100.h,
                  ),
                  Container(
                      child: Text(
                    "Generate Pass",
                    style:
                        TextStyle(fontSize: 25.h, fontWeight: FontWeight.w600),
                  )),
                ])),
            BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  final generateGatePassState = state as GenerateGatePassState;
                  return state.firstStep
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.r, vertical: 20.r),
                          margin: EdgeInsets.symmetric(horizontal: 20.r),
                          decoration: BoxDecoration(
                              color: AppColors.primaryShadeLight,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Form(
                            // key: addFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark,
                                          fontSize: 22.r,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                // ContextField(
                                //   controller: value.dataController,
                                //   hintText: "Name",
                                //   readOnly: true,
                                //   hintColor: Colors.black,
                                //   ontap: () {
                                //     value.selectDate(context);
                                //   },
                                // ),
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Contact",
                                      style: TextStyle(
                                          color: AppColors.primaryColorDark,
                                          fontSize: 22.r,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        addContactAlert(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColorDark,
                                            borderRadius:
                                                BorderRadius.circular(20.r)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                Container(
                                  height: 0.4.sh,
                                  decoration: BoxDecoration(
                                      color: grey,
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                ),

                                // DropdownWigdet(
                                //   labelText: 'Pass Type',
                                //   hintText: 'Select Pass Type',
                                //   validator: (txt) {
                                //     if (txt.toString().isEmpty) {
                                //       return "* Required";
                                //     } else
                                //       return null;
                                //   },
                                //   list: ['UBIT', 'KUBS', "Mass Communication"]
                                //       .map((String value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: Text(
                                //         value,
                                //         style: TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 16.sp),
                                //       ),
                                //     );
                                //   }).toList(),
                                //   onChanged: (value) {
                                //     print(value.toString());
                                //     // genderValue = value;
                                //   },
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 40),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary:
                                                  AppColors.primaryColorDark,
                                              // shadowColor: Colors.transparent,
                                              // onPrimary: itemGradient1Light,
                                              // animationDuration: defaultAnimationDelay,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30))),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 30),
                                            child: Text(
                                                value.firstStep
                                                    ? "Next"
                                                    : "Generate",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.r),
                          padding: EdgeInsets.symmetric(horizontal: 20.r),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColorLight,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Form(
                            // key: addFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                // ContextField(
                                //     controller: value.addNameController,
                                //     hintText: "Name"),
                                // ContextField(
                                //     controller: value.addCNICController,
                                //     hintText: "CNIC"),
                                // ContextField(
                                //     controller: value.addPhoneController,
                                //     hintText: "Mobile Number"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    state.firstStep
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                top: 30, bottom: 40),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: AppColors
                                                        .primaryColorDark,
                                                    // shadowColor: Colors.transparent,
                                                    // onPrimary: itemGradient1Light,
                                                    // animationDuration: defaultAnimationDelay,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                onPressed: () {
                                                  cubit.onStepUpdate(false);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 30),
                                                  child: Text("Next",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white)),
                                                )),
                                          )
                                        : Container(
                                            margin: EdgeInsets.only(
                                                top: 30, bottom: 40),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: AppColors
                                                        .primaryColorDark,
                                                    // shadowColor: Colors.transparent,
                                                    // onPrimary: itemGradient1Light,
                                                    // animationDuration: defaultAnimationDelay,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                onPressed: () {},
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 30),
                                                  child: Text("Generate",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white)),
                                                )),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                })
          ],
        ),
      )),
    ));
  }
}
