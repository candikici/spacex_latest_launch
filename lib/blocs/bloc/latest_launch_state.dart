part of 'latest_launch_bloc.dart';

abstract class LatestLaunchState extends Equatable {
  final List<Launch> latestLaunches;

  const LatestLaunchState({this.latestLaunches = const []});

  @override
  List<Object> get props => [];
}

class LatestLaunchInitial extends LatestLaunchState {
  const LatestLaunchInitial({required List<Launch> launches})
      : super(latestLaunches: launches);
}

class LatestLaunchesLoaded extends LatestLaunchState {
  const LatestLaunchesLoaded({required List<Launch> launches})
      : super(latestLaunches: launches);
}

class LoadingState extends LatestLaunchState {}

class RefreshingState extends LatestLaunchState {
  final List<Launch> launches;

  const RefreshingState({required this.launches});
}

class FetchError extends LatestLaunchState {
  final String message;

  const FetchError({required this.message});
}
