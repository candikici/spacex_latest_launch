import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/view/widgets/launch_card.dart';
import '../../models/launch.dart';
import '../../utilities/show_modal.dart';
import '../widgets/launch_detail.dart';

Widget buildLaunchItem(Launch launch, BuildContext context) {
  return GestureDetector(
    onTap: () => showLaunchDetailModal(context, LaunchDetail(launch: launch)),
    child: LaunchCard(launch: launch),
  );
}
