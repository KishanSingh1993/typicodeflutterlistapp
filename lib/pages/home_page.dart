

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typicode_listapp/controllers/post_controller.dart';

import 'details_page.dart';

class HomePage extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (postController.postList.isEmpty) {
          return const Center(child: Text('No posts found'));
        } else {
          return ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(postController.postList[index].title),
                    onTap: () {
                      Get.to(() => DetailsPage(postId: postController.postList[index].id));
                    },
                  ),
                  const Divider(),  // Add divider here
                ],
              );
            },
          );
        }
      }),
    );
  }
}