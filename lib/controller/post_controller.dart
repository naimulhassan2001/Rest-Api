import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/utils/url/app_url.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  RxList postList = [].obs;

  RxBool isLoading = false.obs;



  Future<void> fetchPostList() async {
    print("object") ;
    try {
      isLoading.value = true;
      final url = Uri.parse(AppUrl.post);
      var response = await http.get(url);
      isLoading.value = false;

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData.toString()) ;
        for (var item in jsonData) {
          postList.add(PostModel.fromJson(item));
        }
      } else {}
    } catch (e) {}
  }
}
