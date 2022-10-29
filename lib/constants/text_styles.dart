import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/constants/colors.dart';

class SpacexLatestTextStyles {
  static const nameTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24);
  static const dateTextStyle = TextStyle(
      color: SpacexLatestColors.dateColor,
      fontWeight: FontWeight.w500,
      fontSize: 10);
  static const detailTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
  static const moredetailTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14);
  static const failureTextStyle = TextStyle(
      color: SpacexLatestColors.failureColor,
      fontWeight: FontWeight.w500,
      fontSize: 14);
}
