import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import '/cubit/page_cubit.dart';
import '/cubit/auth_cubit.dart';
import '/cubit/seat_cubit.dart';
import '/routes/app_pages.dart';
import '/views/pages/pages.dart';
import '/cubit/destination_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageCubit()),
        BlocProvider(create: (_) => SeatCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => DestinationCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: AppPage().pages,
      ),
    );
  }
}
