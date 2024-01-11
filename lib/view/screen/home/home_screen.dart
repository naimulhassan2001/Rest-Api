import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/core/app_route/app_route.dart';
import 'package:rest_api/utils/string/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.restApi),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoute.users),
              child: Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Center(child: Text(
                    AppString.users,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),

                )),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoute.post),
              child: Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Center(child: Text(
                    AppString.post,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),

                )),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoute.comment),
              child: Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Center(child: Text(
                    AppString.comments,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),

                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
