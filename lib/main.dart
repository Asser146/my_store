import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/Home/data/item.dart';
import 'package:my_store/features/Home/data/rating.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';
import 'package:my_store/features/main%20screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // Initialize Hive with Hive Flutter
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(RatingAdapter());
  await HiveServices().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return const MaterialApp(home: MainScreen());
      },
    );
  }
}
