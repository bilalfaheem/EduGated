import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';
import 'package:edugated/features/guest/guest_state.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'guest_cubit.dart';

class GuestPage extends StatefulWidget {
  final GuestCubit cubit;

  const GuestPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestState();
}

class _GuestState extends State<GuestPage> {
  GuestCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            final guestState = state as GuestState;
            return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateGatePassScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.fromLTRB(22, 22, 0, 20),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(30)),
                            child: Image.asset(AppAssets.pass,
                                height: 90, color: AppColors.primaryColorDark),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateGatePassScreen()));
                          },
                          child: Container(
                              // width: 240,
                              margin: const EdgeInsets.only(top: 5, bottom: 10),
                              padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColorDark,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.primaryColorLight,
                                    size: 40,
                                  ),
                                  Text(
                                    " Guest Pass",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ],
                              ))),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            cubit.onTabUpdated(GuestPassType.active);
                          },
                          child: AnimatedContainer(
                            width: 150.w,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 15),
                            decoration: BoxDecoration(
                                color: state.selectedTab == GuestPassType.active
                                    ? AppColors.primaryColorDark
                                    : AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Active",
                                style: TextStyle(
                                    color: state.selectedTab ==
                                            GuestPassType.active
                                        ? Colors.white
                                        : AppColors.primaryColorDark,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.onTabUpdated(GuestPassType.active);
                          },
                          child: AnimatedContainer(
                            width: 150.w,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 15),
                            decoration: BoxDecoration(
                                color:
                                    state.selectedTab == GuestPassType.history
                                        ? AppColors.primaryColorDark
                                        : AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                " History",
                                style: TextStyle(
                                    color: state.selectedTab ==
                                            GuestPassType.history
                                        ? Colors.white
                                        : AppColors.primaryColorDark,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        DateFormat('dd MMM yyy').format(
                            DateTime.parse("2023-12-06T10:52:51.000000")),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                // employeeActivityTile(false, "name", "true", "2023-12-06T10:52:51.000000")
                // FutureBuilder(
                //     future: getEmployeeActivityFunc(
                //         "my_activity", "user_id", attendeesId),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             SizedBox(
                //               height: 200,
                //             ),
                //             Center(
                //                 child: CircularProgressIndicator(
                //               strokeWidth: 1.5,
                //               color: AppColors.primaryColorDark,
                //             ))
                //           ],
                //         );
                //       } else if (snapshot.hasData) {
                //         return Column(children: [
                //           ListView.builder(
                //               padding: EdgeInsets.zero,
                //               physics: NeverScrollableScrollPhysics(),
                //               shrinkWrap: true,
                //               itemCount: employeeActivityList.length,
                //               reverse: true,
                //               // detailList.reviews?.length,
                //               itemBuilder: (BuildContext context, int i) {
                //                 return employeeActivityWidget(
                //                     false,
                //                     attendeesName,
                //                     employeeActivityList[i].activityDate.toString(),
                //                     employeeActivityList[i].activityList);
                //                 // Text(
                //                 //     allActivityList[i].activityDate.toString());
                //               }),
                //         ]);
                //       } else {
                //         return Container();
                //       }
                //     }),
              ],
            ));
          }),
    ));
  }
}
