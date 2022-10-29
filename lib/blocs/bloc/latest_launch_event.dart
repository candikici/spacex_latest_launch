part of 'latest_launch_bloc.dart';

abstract class LatestLaunchEvent extends Equatable {
  const LatestLaunchEvent();

  @override
  List<Object> get props => [];
}

class FetchLatestLaunches extends LatestLaunchEvent {}

class RefreshLatesLaunches extends LatestLaunchEvent {}
