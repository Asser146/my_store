import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/colors.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/main_screen/presentation/profile_tab/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile",
                style:
                    TextStyles.font24BlackBold.copyWith(color: Colors.white)),
            SizedBox(height: 12.h),
            TextButton(
                onPressed: () {
                  context.read<ProfileCubit>().logout();
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.login);
                },
                child: const Text("Logout")),
            TextButton(
                onPressed: () {
                  context.read<ProfileCubit>().deleteAccount();
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(Routes.register);
                },
                child: const Text("Delete Account")),
          ],
        ),
      ),
    );
  }
}
