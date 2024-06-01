import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_client/pages/details_page.dart';
import 'package:portfolio_client/pages/projects_page.dart';
import 'package:portfolio_client/services/http_service_Singleton.dart';
import 'package:portfolio_client/shared/constants.dart';

import 'package:logging/logging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // todo : pass it down to all of them
  final http_service = HttpService.Instance();

  // late var project = http_service.getProject();

  final logger = Logger('logger');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Portfolio',
        // theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //      useMaterial3: true,
        //    ),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
        // home: DetailsPage(
        //   http_service: http_service,
        //   project_id: 4,
        // )
        home: ProjectsPage(
          http_service: http_service,
        ));
    //home: ProjectsPage());
  }
}

/* FutureBuilder(
            future: http_service.getProject(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                var project = snapshot.data;
                print(project!);
                return Text(project!.toString());
              }
              return Text('ERROR');
            })); */