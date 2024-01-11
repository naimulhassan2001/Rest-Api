import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/controller/post_controller.dart';
import 'package:rest_api/utils/string/app_string.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    postController.fetchPostList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.post),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Obx(() => Center(
              child: postController.isLoading.value
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: postController.postList.length,
                      itemBuilder: (context, index) {
                        var item = postController.postList[index];
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
                                  Text("userId: ${item.userId}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Text("title: ${item.title}"),
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
