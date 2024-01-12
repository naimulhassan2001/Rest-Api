import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/model/user_model.dart';
import 'package:rest_api/services/network_api_service.dart';
import 'package:rest_api/utils/url/app_url.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxList userList = [].obs;

  RxBool isLoading = false.obs;

  NetworkApiService networkApiService = NetworkApiService();

  Future<void> fetchUserList() async {
    print("object");

    networkApiService.getApi(AppUrl.users).then((value) {
      for (var item in value) {
        userList.add(UserModel.fromJson(item));
      }
    });

    // try {
    //   isLoading.value = true;
    //   final url = Uri.parse(AppUrl.users);
    //   var response = await http.get(url);
    //   isLoading.value = false;
    //
    //   if (response.statusCode == 200) {
    //     var jsonData = jsonDecode(response.body);
    //     print(jsonData.toString()) ;
    //     for (var item in jsonData) {
    //       userList.add(UserModel.fromJson(item));
    //     }
    //   } else {}
    // } catch (e) {}
  }
}
