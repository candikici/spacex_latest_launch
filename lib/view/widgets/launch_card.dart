import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import '../../constants/constant_exports.dart';

class LaunchCard extends StatelessWidget {
  const LaunchCard({
    Key? key,
    required this.launch,
  }) : super(key: key);

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SpacexLatestSizes.patchHeight + 16,
      margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 37),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: SpacexLatestColors.launchItemBG,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: launch.patch.small,
            height: SpacexLatestSizes.patchHeight,
            width: SpacexLatestSizes.patchWidth,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  launch.name,
                  style: SpacexLatestTextStyles.nameTextStyle,
                ),
                Text(
                  launch.date,
                  style: SpacexLatestTextStyles.dateTextStyle,
                ),
                Expanded(
                  child: Text(
                    launch.details.isEmpty
                        ? "Details cannot be found."
                        : launch.details,
                    overflow: TextOverflow.fade,
                    style: SpacexLatestTextStyles.detailTextStyle,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Detail >>",
                  style: SpacexLatestTextStyles.moredetailTextStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
