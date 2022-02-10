import 'package:clean_architecture/injections.dart';
import 'package:clean_architecture/presentation/bloc/item/item_bloc.dart';
import 'package:clean_architecture/presentation/routes/route.dart';
import 'package:clean_architecture/presentation/themes/app_theme.dart';
import 'package:clean_architecture/single_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  BlocOverrides.runZoned(
    () {
      runApp(const CleanCode());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class CleanCode extends StatelessWidget {
  const CleanCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ItemBloc>()..add(ItemOnFinds()))
      ],
      child: MaterialApp(
        theme: AppTheme.theme(context),
        initialRoute: AppRoute.initial,
        routes: AppRoute.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
