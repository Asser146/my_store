import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/Home/presentation/cubit/bottom_bar_cubit/cubit/bottom_bar_cubit.dart';
import 'package:my_store/features/Home/presentation/widgets/bottom_bar.dart';
import 'package:my_store/features/Home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeScreenBody()),
      bottomNavigationBar: BlocProvider(
        create: (context) => BottomBarCubit(),
        child: BottomBar(),
      ),
    );
  }
}
