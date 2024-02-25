import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'guest_pass_initial_params.dart';
import 'guest_pass_page.dart';

class GuestPassNavigator {}

mixin GuestPassRoute {
  openGuestPass(GuestPassInitialParams initialParams) {
    navigator.push(
      context,
      GuestPassPage(cubit: getIt(param1: initialParams)),
    );
    navigator.pushReplacement(
      context,
      GuestPassPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
