import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex_latest_launch/models/failure.dart';

import '../../constants/constant_exports.dart';

ListView buildFailuresList(List<Failure> failures) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(vertical: 10),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: failures.length,
    separatorBuilder: (BuildContext context, int index) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SvgPicture.asset(AssetPaths.divider),
    ),
    itemBuilder: (BuildContext context, int index) {
      var failure = failures[index];
      return Text(
        failure.reason,
        textAlign: TextAlign.center,
        style: SpacexLatestTextStyles.failureTextStyle,
      );
    },
  );
}
