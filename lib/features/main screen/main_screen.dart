import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main%20screen/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:my_store/features/Home/presentation/home_screen.dart';
import 'package:my_store/features/Home/presentation/widgets/bottom_bar.dart';
import 'package:my_store/features/main%20screen/items_list_cubit/items_list_cubit.dart';
import 'package:my_store/features/search/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomBarCubit, BottomBarState>(
        builder: (context, state) {
          if (state is BottomBarHomeSelected) {
            return SafeArea(
              child: BlocBuilder<ItemsListCubit, ItemsListState>(
                builder: (context, state) {
                  if (state is ItemsListStateLoaded) {
                    return HomeScreen(itemsList: state.itemsList);
                  } else if (state is ItemsListStateLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ItemsListStateError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(
                        child: Text('Unexpected error occurred'));
                  }
                },
              ),
            );
          } else if (state is BottomBarSearchSelected) {
            return const SafeArea(child: SearchScreen());
          } else if (state is BottomBarCartSelected) {
            return const Placeholder();
          }
          return Container(); // Fallback
        },
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
