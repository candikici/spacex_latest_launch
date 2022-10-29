import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex_latest_launch/blocs/bloc_exports.dart';
import 'package:spacex_latest_launch/constants/asset_paths.dart';
import 'package:spacex_latest_launch/view/widgets/launch_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double topPadding = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero, (() {
      topPadding = MediaQuery.of(context).viewPadding.top;
    }));

    super.initState();
    context.read<LatestLaunchBloc>().add(FetchLatestLaunches());
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPaths.bg),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<LatestLaunchBloc, LatestLaunchState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                    child: CupertinoActivityIndicator(
                  color: Colors.white,
                ));
              } else if (state is RefreshingState) {
                return LaunchList(
                    launches: state.launches, topPadding: topPadding);
              } else if (state is LatestLaunchesLoaded) {
                return LaunchList(
                    launches: state.latestLaunches, topPadding: topPadding);
              } else if (state is FetchError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
