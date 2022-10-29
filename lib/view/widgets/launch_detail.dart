import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';

import '../../constants/constant_exports.dart';
import '../components/build_failures_list.dart';
import '../components/build_links_row.dart';
import '../components/build_modal_notch.dart';

class LaunchDetail extends StatelessWidget {
  const LaunchDetail({
    Key? key,
    required this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Column(
          children: [
            buildModalNotch(),
            const SizedBox(height: 30),
            CachedNetworkImage(
              imageUrl: launch.patch.small,
              height: SpacexLatestSizes.patchHeight,
              width: SpacexLatestSizes.patchWidth,
            ),
            const SizedBox(height: 24),
            Text(
              launch.name,
              style: SpacexLatestTextStyles.nameTextStyle,
            ),
            const SizedBox(height: 4),
            Text(
              launch.date,
              style: SpacexLatestTextStyles.dateTextStyle,
            ),
            const SizedBox(height: 20),
            Text(
              launch.details.isEmpty
                  ? "Details cannot be found."
                  : launch.details,
              style: SpacexLatestTextStyles.detailTextStyle,
            ),
            buildLinksRow(launch, context),
            if (launch.failures != null && launch.failures!.isNotEmpty) ...[
              const Text(
                "Failures",
                style: SpacexLatestTextStyles.moredetailTextStyle,
              ),
              buildFailuresList(launch.failures!),
            ]
          ],
        ),
      ),
    );
  }
}
