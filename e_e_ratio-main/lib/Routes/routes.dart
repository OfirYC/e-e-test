import 'package:e_e_ratio/Auth/login.dart';
import 'package:e_e_ratio/Auth/register.dart';
import 'package:e_e_ratio/Components/add_single_activity.dart';
import 'package:e_e_ratio/Screens/activity.dart';
import 'package:e_e_ratio/Screens/add_activity.dart';
import 'package:e_e_ratio/Screens/leaderboard.dart';
import 'package:e_e_ratio/Screens/progress.dart';
import 'package:get/get.dart';

import '../Screens/home.dart';

class Routes{
  static final routes = [
    GetPage(
      name: '/home',
      page: () =>  Home(),
    ),
    GetPage(
      name: '/activity',
      page: () =>  Activity(),
    ),
    GetPage(
      name: '/progress',
      page: () =>  UserProgress(),
    ),
    GetPage(
      name: '/leaderboard',
      page: () =>  Leaderboard(),
    ),
    GetPage(
      name: '/addActivity',
      page: () =>  AddActivity(),
    ),
    GetPage(
      name: '/addSingleActivity',
      page: () =>  AddSingleActivity(),
    ),
    GetPage(
      name: '/login',
      page: () =>  Login(),
    ),
    GetPage(
      name: '/register',
      page: () =>  Register(),
    ),
  ];
}