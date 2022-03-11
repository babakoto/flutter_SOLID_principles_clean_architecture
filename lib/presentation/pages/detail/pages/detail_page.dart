import 'package:clean_architecture/presentation/bloc/item/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
          if (state.currentItem != null) {
            return Text("Current Item : ${state.currentItem?.name}");
          } else {
            return const Text("Page not found");
          }
        }),
      ),
    );
  }
}
