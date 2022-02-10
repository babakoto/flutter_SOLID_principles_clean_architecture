import 'package:clean_architecture/presentation/bloc/item/item_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ItemBloc, ItemState>(listener: (context, state) {
          if (state.status == Status.serverError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red, content: Text("Server Error")));
          }

          if (state.status == Status.networkError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red, content: Text("Not connected ")));
          }
        }, builder: (context, state) {
          if (state.status == Status.empty) {
            return const Center(child: Text('Empty'));
          } else if (state.status == Status.loading) {
            return const Center(child: Text('Loading ...'));
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ItemBloc>().add(ItemOnFinds());
              },
              child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                        leading: CircleAvatar(
                          child: Text("${state.items[index].id}"),
                        ),
                        title: Text(
                          state.items[index].name,
                          style: textTheme.bodyText1,
                        ));
                  }),
            );
          }
        }),
      ),
    );
  }
}
