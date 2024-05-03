import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trading_app/modules/home/bloc/live_data_bloc.dart';
import 'package:trading_app/utils/global_constants.dart';

import 'modules/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
       BlocProvider<LiveDataBloc>(create: (context) =>  LiveDataBloc()),
     ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: GlobalConstants.appTheme,
        home: const HomeScreen(),
      )
    );
  }
}