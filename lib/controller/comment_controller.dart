
import 'package:get/get.dart';
import 'package:rest_api/model/comment_model.dart';
import 'package:rest_api/utils/url/app_url.dart';
import '../services/network_api_service.dart';

class CommentController extends GetxController {
  RxList commentList = [].obs;

  RxBool isLoading = false.obs;

  NetworkApiService networkApiService = NetworkApiService();


  Future<void> fetchCommentList() async {
    print("object") ;
    networkApiService.getApi(AppUrl.comments).then((value) {
      for (var item in value) {
        commentList.add(CommentModel.fromJson(item));
      }

      print(commentList.length) ;
    });
  }
}
