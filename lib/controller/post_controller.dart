import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/utils/url/app_url.dart';
import 'package:http/http.dart' as http;

import '../services/network_api_service.dart';

class PostController extends GetxController {
  RxList postList = [].obs;

  RxBool isLoading = false.obs;

  NetworkApiService networkApiService = NetworkApiService();


  Future<void> fetchPostList() async {
    print("object") ;



    networkApiService.getApi(AppUrl.post).then((value) {
      for (var item in value) {
        postList.add(PostModel.fromJson(item));
      }
    });

  }
}
