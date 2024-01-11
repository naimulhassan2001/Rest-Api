


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/comment_controller.dart';

import '../../../utils/string/app_string.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});

  CommentController commentController = Get.put(CommentController()) ;

  @override
  Widget build(BuildContext context) {
    commentController.fetchCommentList() ;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.comments),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Obx(() => Center(
          child: commentController.isLoading.value
              ? const CircularProgressIndicator()
              : ListView.builder(
            itemCount: commentController.commentList.length,
            itemBuilder: (context, index) {
              var item = commentController.commentList[index];
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
                        Text("postId: ${item.postId}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text("name: ${item.name}"),
                        Text("email: ${item.email}"),
                        const SizedBox(height: 8,),
                        Text("body: ${item.body}"),
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
