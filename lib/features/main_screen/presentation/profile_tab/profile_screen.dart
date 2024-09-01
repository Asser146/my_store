import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/routing/routes.dart';
import 'package:my_store/core/theming/styles.dart';
import 'package:my_store/features/auth/login_cubit/login_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Profile", style: TextStyles.font24BlackBold),
        SizedBox(height: 12.h),
        TextButton(
            onPressed: () {
              context.read<LoginCubit>().logout();
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(Routes.login, arguments: 1);
            },
            child: Text("Logout")),
        TextButton(
            onPressed: () {
              context.read<LoginCubit>().deleteAccount();
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(Routes.register);
            },
            child: Text("Delete Account")),
      ],
    );
  }
}
