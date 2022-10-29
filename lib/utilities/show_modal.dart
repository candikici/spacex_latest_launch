import 'package:flutter/material.dart';

import '../constants/colors.dart';

Future<dynamic> showLaunchDetailModal(
    BuildContext context, Widget sheetToShow) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: SpacexLatestColors.launchItemBG,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24))),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: sheetToShow,
      );
    },
  );
}
