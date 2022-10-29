import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_paths.dart';
import '../../models/launch.dart';
import '../../utilities/helpers.dart';

Padding buildLinksRow(Launch launch, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 20, left: 100, right: 100),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (launch.webcast != null && launch.webcast!.isNotEmpty)
          buildLink(
              assetPath: AssetPaths.youtube,
              url: launch.webcast!,
              context: context),
        if (launch.wikipedia != null && launch.wikipedia!.isNotEmpty)
          buildLink(
              assetPath: AssetPaths.wikipedia,
              url: launch.wikipedia!,
              context: context),
        if (launch.article != null && launch.article!.isNotEmpty)
          buildLink(
              assetPath: AssetPaths.article,
              url: launch.article!,
              context: context),
      ],
    ),
  );
}

GestureDetector buildLink(
    {required String url,
    required BuildContext context,
    required String assetPath}) {
  return GestureDetector(
      onTap: () => launchURL(url: url, ctx: context),
      child: SvgPicture.asset(assetPath));
}
