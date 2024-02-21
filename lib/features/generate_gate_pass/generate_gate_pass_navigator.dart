import 'package:edugated/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:edugated/main.dart';
import 'generate_gate_pass_initial_params.dart';
import 'generate_gate_pass_page.dart';

class GenerateGatePassNavigator {}

mixin GenerateGatePassRoute {
  openGenerateGatePass(GenerateGatePassInitialParams initialParams) {
    navigator.push(
      context,
      GenerateGatePassPage(cubit: getIt(param1: initialParams)),
    );
  }

  Navigation get navigator;

  BuildContext get context;
}
