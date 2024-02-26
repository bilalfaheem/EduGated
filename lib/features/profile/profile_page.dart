import 'package:edugated/features/profile/widget/profile_tile.dart';
import 'package:edugated/resources/app_assets.dart';
import 'package:edugated/widget/content.dart';
import 'package:edugated/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;

  const ProfilePage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  ProfileCubit get cubit => widget.cubit;

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
          data: "Profile",
          size: 24.h,
          weight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.h),
            child: Image.asset(
              AppAssets.logo,
              height: 170.h,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20.h),
              child: Column(
                children: [
                  ProfileTile(text: "Name", image: AppAssets.profile),
                  ProfileTile(text: "email", image: AppAssets.office),
                  ProfileTile(text: "email", image: AppAssets.email),
                  ProfileTile(text: "email", image: AppAssets.phone)
                ],
              )),
          PrimaryButton(width: 200.w, title: "LogOut", onTap: () {})
        ],
      ),
    );
  }
}
