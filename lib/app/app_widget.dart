import 'package:comic_vine/app/shared/cubit/comic_vine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ComicVineCubit>(
            create: (context) => Modular.get<ComicVineCubit>(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Slidy',
          theme: ThemeData(primarySwatch: Colors.blue),
        ).modular());
  }
}
