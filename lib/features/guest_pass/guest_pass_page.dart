import 'package:edugated/features/guest_pass/guest_pass_state.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/content_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  title: Content(data: "Pass Detail", size: 24.h,weight: FontWeight.w600,),
),
body:BlocBuilder(
  builder: (context,state) {
    final guestPassState = state as GuestPassState;
    return Column(
      children: [
      ContentField( hintText:cubit.initialParams.pass.contactName),
      ContentField( hintText:cubit.initialParams.pass.passDate),

      ],
    );
  }
)
);
}
}
