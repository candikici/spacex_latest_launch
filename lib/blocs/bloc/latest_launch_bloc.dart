import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:spacex_latest_launch/constants/api_endpoints.dart';
import 'package:spacex_latest_launch/blocs/bloc_exports.dart';
import 'package:spacex_latest_launch/services/http/http_service.dart';

import '../../models/launch.dart';

part 'latest_launch_event.dart';
part 'latest_launch_state.dart';

class LatestLaunchBloc extends Bloc<LatestLaunchEvent, LatestLaunchState> {
  final HttpService httpService;
  LatestLaunchBloc({required this.httpService})
      : super(const LatestLaunchInitial(launches: [])) {
    on<FetchLatestLaunches>(((event, emit) => fetchLatestLaunches(emit)));
    on<RefreshLatesLaunches>(((event, emit) => refreshLatestLaunches(emit)));
  }

  fetchLatestLaunches(Emitter<LatestLaunchState> emit) async {
    emit(LoadingState());
    var launches = await fetchFromAPI();
    if (launches != null) {
      emit(LatestLaunchesLoaded(launches: launches));
    } else {
      emit(const FetchError(message: "Bir hata oluştu."));
    }
  }

  refreshLatestLaunches(Emitter<LatestLaunchState> emit) async {
    emit(RefreshingState(launches: state.latestLaunches));
    var launches = await fetchFromAPI();
    if (launches != null) {
      emit(LatestLaunchesLoaded(launches: launches));
    } else {
      emit(const FetchError(message: "Bir hata oluştu."));
    }
  }

  Future<List<Launch>?> fetchFromAPI() async {
    try {
      var response = await httpService.get(url: SpacexLatestURLs.baseURL);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        var decodedJson = json.decode(response.body);
        List<Launch> launches =
            List<Launch>.from(decodedJson.map((x) => Launch.fromMap(x)));
        return launches;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
