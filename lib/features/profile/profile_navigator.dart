import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'profile_initial_params.dart';
import 'profile_page.dart';

class ProfileNavigator {}

mixin ProfileRoute {
openProfile(ProfileInitialParams initialParams) {
navigator.push(
context,
ProfilePage(cubit: getIt(param1: initialParams)),
);
}

Navigation get navigator;

BuildContext get context;
}
