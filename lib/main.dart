import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injections.dart';
import 'presentation/bloc/item/item_bloc.dart';
import 'presentation/routes/route.dart';
import 'presentation/themes/app_theme.dart';
import 'single_bloc_observer.dart';

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
