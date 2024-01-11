

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/user_controller.dart';
import 'package:rest_api/model/user_model.dart';

import '../../../utils/string/app_string.dart';

class UserScreeen extends StatelessWidget {
  UserScreeen({super.key});

  UserController userController = Get.put(UserController()) ;

  @override
  Widget build(BuildContext context) {
    userController.fetchUserList() ;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.users),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Obx(() => Center(
          child: userController.isLoading.value
              ? const CircularProgressIndicator()
              : ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              UserModel item = userController.userList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("id: ${item.id}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Text("name: ${item.name}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text("username: ${item.username}"),
                        Text("email: ${item.email}"),
                        Text("address: ${item.address!.city}"),
                        Text("phone: ${item.phone}"),
                        Text("website: ${item.website}"),
                        Text("company: ${item.company!.name}"),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )),
      ),
    );
  }
}
