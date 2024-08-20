import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main%20screen/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:my_store/features/main%20screen/items_list_cubit/items_list_cubit.dart';
import 'package:my_store/features/main%20screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => BottomBarCubit()),
              BlocProvider(create: (_) => ItemsListCubit()..init()),
            ],
            child: const MainScreen(),
          ),
        );
      },
    );
  }
}
