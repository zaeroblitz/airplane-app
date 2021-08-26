import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/routes/app_pages.dart';
import 'views/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: AppPage().pages,
      ),
    );
  }
}
