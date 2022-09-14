import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/anasayfa.dart';
import 'package:todo_app/cubit/anasayfa_cubit.dart';
import 'package:todo_app/cubit/is_detay_cubit.dart';
import 'package:todo_app/cubit/is_kayit_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => IsKayitCubit()),
        BlocProvider(create: (context) => IsDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}
