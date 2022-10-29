import 'package:flutter/cupertino.dart';
import 'package:spacex_latest_launch/models/launch.dart';
import 'package:spacex_latest_launch/utilities/sliver_delegate.dart';

import '../../blocs/bloc_exports.dart';
import '../components/build_launch_item.dart';

class LaunchList extends StatelessWidget {
  const LaunchList({Key? key, required this.launches, required this.topPadding})
      : super(key: key);

  final List<Launch> launches;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverPersistentHeader(
          delegate: HeaderDelegate(topPadding: topPadding), pinned: true),
      CupertinoSliverRefreshControl(
        onRefresh: () async =>
            context.read<LatestLaunchBloc>().add(RefreshLatesLaunches()),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, i) {
          var launch = launches[i];
          return buildLaunchItem(launch, context);
        }, childCount: launches.length),
      )
    ]);
  }
}
