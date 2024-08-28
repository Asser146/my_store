import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/routing/app_router.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/data/rating.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(RatingAdapter());
  HiveServices hiveServices = HiveServices();
  await hiveServices.init(); //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter(); // Create an instance of AppRouter

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute:
              _appRouter.generateRoute, // Use the AppRouter for navigation
          initialRoute: Routes.login, // Set the initial route
        );
      },
    );
  }
}
