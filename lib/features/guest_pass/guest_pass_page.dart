import 'package:edugated/features/guest_pass/guest_pass_state.dart';
import 'package:edugated/features/guest_pass/widget/guest_pass_tile.dart';
import 'package:edugated/resources/app_colors.dart';
import 'package:edugated/resources/extension.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'guest_pass_cubit.dart';

class GuestPassPage extends StatefulWidget {
  final GuestPassCubit cubit;

  const GuestPassPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<GuestPassPage> createState() => _GuestPassState();
}

class _GuestPassState extends State<GuestPassPage> {
  GuestPassCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Content(
            data: "Pass Detail",
            size: 24.h,
            weight: FontWeight.w600,
          ),
        ),
        body: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
          final guestPassState = state as GuestPassState;
          return Center(
            child: Container(
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.all(30),

                      decoration: BoxDecoration(
                        color: AppColors.primaryColorLight,
                        borderRadius: BorderRadius.circular(20.r)
                      ),

              child: Column(
                children: [
                  Container(
                    width: 200.h,
                    height: 200.h,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: PrettyQrView(
                        qrImage: QrImage(QrCode.fromData(
                            data: cubit.initialParams.pass.qrCode,
                            errorCorrectLevel: 1)),
                        decoration: const PrettyQrDecoration(
                            shape: PrettyQrSmoothSymbol(
                                color: AppColors.primaryColorDark, roundFactor: 1)),
                      )),
                  GuestPassTile(title: "Name", value:cubit.initialParams.pass.contactName),
                  GuestPassTile(title: "Phone", value:cubit.initialParams.pass.contactPhone),
                  GuestPassTile(title: "Date", value:cubit.initialParams.pass.passDate.toFormatDateTime(format: "dd/MMM/yy")),

                    
                ],
              ),
            ),
          );
        }));
  }
}
