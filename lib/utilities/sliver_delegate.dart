import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex_latest_launch/constants/asset_paths.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double topPadding;

  HeaderDelegate({required this.topPadding});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding:
              EdgeInsets.only(top: topPadding, bottom: 20, left: 20, right: 20),
          child: SvgPicture.asset(AssetPaths.spacexLogo),
        ));
  }

  @override
  double get maxExtent => topPadding + 65;

  @override
  double get minExtent => topPadding + 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
