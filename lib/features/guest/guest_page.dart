import 'package:edugated/features/activity/widget/activity_tile.dart';
import 'package:edugated/features/generate_gate_pass/generate_gate_pass_initial_params.dart';
import 'package:edugated/features/guest/domain.models/guest_pass_type.dart';
import 'package:edugated/features/guest/guest_state.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/resources/utils.dart';
import 'package:edugated/widget/content.dart';
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
    cubit.navigator.context = context;
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
                            cubit.onTapCreateGuestPass(
                                const GenerateGatePassInitialParams());
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateGatePassScreen()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
                            padding: const EdgeInsets.fromLTRB(22, 22, 0, 20),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(30)),
                            child: Image.asset(AppAssets.pass,
                                height: 90.h,
                                color: AppColors.primaryColorDark),
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
                              child: Center(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: AppColors.primaryColorLight,
                                    size: 30.h,
                                  ),
                                  const Text(
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
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // margin: EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 15),
                            decoration: BoxDecoration(
                                color: guestState.selectedTab ==
                                        GuestPassType.active
                                    ? AppColors.primaryColorDark
                                    : AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Active",
                                style: TextStyle(
                                    color: guestState.selectedTab ==
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
                            cubit.onTabUpdated(GuestPassType.history);
                          },
                          child: AnimatedContainer(
                            width: 150.w,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // margin: EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 15),
                            decoration: BoxDecoration(
                                color: guestState.selectedTab ==
                                        GuestPassType.history
                                    ? AppColors.primaryColorDark
                                    : AppColors.primaryColorLight,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                " History",
                                style: TextStyle(
                                    color: guestState.selectedTab ==
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
                Container(
                  height: 0.4.sh,
                  decoration: BoxDecoration(
                      color: AppColors.primaryShadeLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: guestState.error != null
                      ? Center(
                          child: Content(
                            data: guestState.error!,
                            size: 19.r,
                            color: Colors.red,
                          ),
                        )
                      : guestState.isLoading
                          ? Utils.showLoading(context)
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount:
                                  guestState.selectedTab == GuestPassType.active
                                      ? guestState.active.length
                                      : guestState.history.length,
                              itemBuilder: (context, index) {
                                final iteration = guestState.selectedTab ==
                                        GuestPassType.active
                                    ? guestState.active[index]
                                    : guestState.history[index];
                                return ActivityTile();
                              },
                              separatorBuilder: (context, index) =>
                                  15.verticalSpace,
                            ),
                ),
              ],
            ));
          }),
    ));
  }
}
