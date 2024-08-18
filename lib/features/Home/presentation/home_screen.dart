import 'package:flutter/material.dart';
import 'package:my_store/features/Home/presentation/widgets/bottom_bar.dart';
import 'package:my_store/features/Home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeScreenBody()),
      bottomNavigationBar: BottomBar(),
    );
  }
}
