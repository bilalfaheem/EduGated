import 'package:edugated/navigation/navigation.dart';
import 'package:flutter/material.dart';

class AppNavigator implements Navigation {
  @override
  push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  pushReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
