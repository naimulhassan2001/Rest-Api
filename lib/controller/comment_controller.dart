import 'dart:convert';

import 'package:get/get.dart';
import 'package:rest_api/model/comment_model.dart';
import 'package:rest_api/model/post_model.dart';
import 'package:rest_api/utils/url/app_url.dart';
import 'package:http/http.dart' as http;

class CommentController extends GetxController {
  RxList commentList = [].obs;

  RxBool isLoading = false.obs;



  Future<void> fetchCommentList() async {
    print("object") ;
    try {
      isLoading.value = true;
      final url = Uri.parse(AppUrl.comments);
      var response = await http.get(url);
      isLoading.value = false;

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print(jsonData.toString()) ;
        for (var item in jsonData) {
          commentList.add(CommentModel.fromJson(item));
        }
      } else {}
    } catch (e) {}
  }
}
