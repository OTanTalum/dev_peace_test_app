import 'package:devpeace_test_app/bloc/loader_bloc/loader_bloc.dart';
import 'package:devpeace_test_app/bloc/main_bloc/main_bloc.dart';
import 'package:devpeace_test_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (BuildContext context) => MainBloc(),
          ),
          BlocProvider<LoaderBloc>(
            create: (BuildContext context) => LoaderBloc(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
