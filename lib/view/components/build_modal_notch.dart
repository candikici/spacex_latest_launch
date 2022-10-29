import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/constants/colors.dart';

Container buildModalNotch() {
  return Container(
    height: 3,
    width: 80,
    decoration: BoxDecoration(
        color: SpacexLatestColors.modalNotchColor,
        borderRadius: BorderRadius.circular(4)),
  );
}
