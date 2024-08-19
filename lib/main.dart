import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/features/main%20screen/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:my_store/features/main%20screen/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        // Get screen size
        return MaterialApp(
          home: BlocProvider(
            create: (_) => BottomBarCubit(),
            child: MainScreen(),
          ),
        );
      },
    );
  }
}
