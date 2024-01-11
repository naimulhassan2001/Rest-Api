import 'package:get/get.dart';
import 'package:rest_api/view/screen/comment/comment_screen.dart';
import 'package:rest_api/view/screen/home/home_screen.dart';
import 'package:rest_api/view/screen/post/post_screen.dart';
import 'package:rest_api/view/screen/user/user_screen.dart';


class AppRoute {
  static const String post = "/post_screen.dart";
  static const String comment = "/comment_screen.dart";
  static const String users = "/user_screen.dart";
  static const String home = "/home_screen.dart";


  static List<GetPage> routes = [
    GetPage(name: post, page: () => PostScreen()),
    GetPage(name: comment, page: () => CommentScreen()),
    GetPage(name: users, page: () => UserScreeen()),
    GetPage(name: home, page: () => const HomeScreen()),

  ];
}