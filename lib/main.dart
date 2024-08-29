import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/core/helpers/bloc_observer.dart';
import 'package:my_store/core/routing/app_router.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/data/rating.dart';
import 'package:my_store/features/main_screen/domain/hive_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(RatingAdapter());
  HiveServices hiveServices = HiveServices();
  await hiveServices.init(); //
  // Bloc.observer = CustomBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: _appRouter.generateRoute,
          initialRoute: Routes.login,
        );
      },
    );
  }
}
