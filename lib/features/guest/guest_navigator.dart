import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'package:edugated/navigation/navigation.dart';
import 'guest_initial_params.dart';
import 'guest_page.dart';

class GuestNavigator {}

mixin GuestRoute {
openGuest(GuestInitialParams initialParams) {
navigator.push(
context,
GuestPage(cubit: getIt(param1: initialParams)),
);
}

Navigation get navigator;

BuildContext get context;
}
