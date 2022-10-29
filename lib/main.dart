import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacex_latest_launch/blocs/bloc_exports.dart';
import 'package:spacex_latest_launch/services/http/http_service.dart';
import 'package:spacex_latest_launch/view/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LatestLaunchBloc(httpService: httpService))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX Latest Launches',
        theme: ThemeData(
          fontFamily: GoogleFonts.mohave().fontFamily,
        ),
        home: const HomePage(),
      ),
    );
  }
}
