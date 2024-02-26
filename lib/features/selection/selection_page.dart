import 'package:edugated/widget/primary_button.dart';
import 'package:flutter/material.dart';

import 'selection_cubit.dart';

class SelectionPage extends StatefulWidget {
  final SelectionCubit cubit;

  const SelectionPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionState();
}

class _SelectionState extends State<SelectionPage> {
  SelectionCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/logo/logo.png",
                    height: 250,
                  )),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrimaryButton(title: "Student", onTap: () {}),
                PrimaryButton(title: "Resident", onTap: () {}),
                PrimaryButton(title: "Guard", onTap: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
