import 'package:edugated/data/rest_api_activity_repository.dart';
import 'package:edugated/data/rest_api_users_repository.dart';
import 'package:edugated/data/stagging_app_url.dart';
import 'package:edugated/domain/app_url/app_url.dart';
import 'package:edugated/domain/repositories/activity_repository.dart';
import 'package:edugated/domain/repositories/users_repository.dart';
import 'package:edugated/features/activity/activity_cubit.dart';
import 'package:edugated/features/activity/activity_initial_params.dart';
import 'package:edugated/features/activity/activity_navigator.dart';
import 'package:edugated/features/activity/activity_page.dart';
import 'package:edugated/features/gate_pass/gate_pass_cubit.dart';
import 'package:edugated/features/gate_pass/gate_pass_initial_params.dart';
import 'package:edugated/features/gate_pass/gate_pass_navigator.dart';
import 'package:edugated/features/guest/guest_cubit.dart';
import 'package:edugated/features/guest/guest_initial_params.dart';
import 'package:edugated/features/guest/guest_navigator.dart';
import 'package:edugated/features/home/home_cubit.dart';
import 'package:edugated/features/home/home_initial_params.dart';
import 'package:edugated/features/home/home_navigator.dart';
import 'package:edugated/features/home/home_page.dart';
import 'package:edugated/navigation/app_navigator.dart';
import 'package:edugated/navigation/navigation.dart';
import 'package:edugated/network/network.dart';
import 'package:edugated/network/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  getIt.registerSingleton<AppUrl>(StaggingAppUrl());
  getIt.registerSingleton<Network>(NetworkRepository());
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository(getIt()));
  getIt.registerSingleton<ActivityRepository>(
      RestApiActivityRepository(getIt(), getIt()));
  getIt.registerSingleton<Navigation>(AppNavigator());
  getIt.registerSingleton<ActivityNavigator>(ActivityNavigator(getIt()));
  getIt.registerFactoryParam<ActivityCubit, ActivityInitialParams, dynamic>(
      (params, _) => ActivityCubit(params, getIt(), getIt())..fetchActivity());

  getIt.registerSingleton<HomeNavigator>(HomeNavigator());
  getIt.registerSingleton<GatePassNavigator>(GatePassNavigator());
  getIt.registerSingleton<GuestNavigator>(GuestNavigator());

  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
      (params, _) => HomeCubit(params, getIt()));
  getIt.registerFactoryParam<GatePassCubit, GatePassInitialParams, dynamic>(
      (params, _) => GatePassCubit(params, getIt()));
  getIt.registerFactoryParam<GuestCubit, GuestInitialParams, dynamic>(
      (params, _) => GuestCubit(params));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          // return MultiProvider(
          //     providers: [
          //       ChangeNotifierProvider(
          //           create: (_) => LoginPasswordVisibilityProvider()),
          //       ChangeNotifierProvider(
          //           create: (_) => SignupPasswordVisibilityProvider()),
          //       ChangeNotifierProvider(create: (_) => NavbarProvider()),
          //       ChangeNotifierProvider(create: (_) => OfficeNavbarProvider()),
          //       ChangeNotifierProvider(create: (_) => EmployeeDetailProvider()),
          //       ChangeNotifierProvider(create: (_) => GuestPassViewModel()),
          //       ChangeNotifierProvider(
          //           create: (_) => GenerateGatePassViewModel()),
          //       ChangeNotifierProvider(create: (_) => AddContactViewModel()),
          //     ],
          //     child: Builder(builder: (BuildContext context) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: GoogleFonts.nunito().fontFamily),
              home: HomePage(cubit: getIt(param1: HomeInitialParams()))
              // ActivityPage(
              //     cubit: getIt(param1: const ActivityInitialParams()))
              // attendeesType == "company"
              //     ? GuardNavBarScreen()
              //     : attendeesType == "employee"
              //         ? NavBarScreen()
              //         : SelectionScreen(),
              );
          // }));
        });
  }
}
