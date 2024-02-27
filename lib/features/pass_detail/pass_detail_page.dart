import 'package:edugated/features/guest_pass/widget/guest_pass_tile.dart';
import 'package:edugated/features/pass_detail/pass_detail_state.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/resources/extension.dart';
import 'package:edugated/widget/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pass_detail_cubit.dart';

class PassDetailPage extends StatefulWidget {
  final PassDetailCubit cubit;

  const PassDetailPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<PassDetailPage> createState() => _PassDetailState();
}

class _PassDetailState extends State<PassDetailPage> {
  PassDetailCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              final passDetailState = state as PassDetailState;
              return Column(
                children: [
                  passDetailState.initialParams.valid
                      ? Container(
                          padding: const EdgeInsets.all(30),
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColorLight,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            children: [
                              Container(
                                  width: 200.h,
                                  height: 200.h,
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: SizedBox()
                                  // Image.network(
                                  //   cubit.initialParams.pass.userName
                                  // )
                                  ),
                              GuestPassTile(
                                  title: "Name",
                                  value: cubit.initialParams.pass!.contactName
                                      .toString()),
                              GuestPassTile(
                                  title: "Phone",
                                  value:
                                      cubit.initialParams.pass!.contactPhone),
                              GuestPassTile(
                                  title: "Date",
                                  value: cubit.initialParams.pass!.passDate
                                      .toFormatDateTime(format: "dd/MMM/yy")),
                            ],
                          ),
                        )
                      : Content(
                          data: passDetailState.initialParams.error.toString(),
                          size: 30.h,
                          weight: FontWeight.bold,
                          color: AppColors.red,
                        )
                ],
              );
            }));
  }
}
