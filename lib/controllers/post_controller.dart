

import 'package:get/get.dart';
import 'package:typicode_listapp/services/api_service.dart';

import '../model/post.dart';

class PostController extends GetxController{

  var isLoading = true.obs;

  var postList = <Post>[].obs;


  @override
  void onInit(){
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async{

    try{

      isLoading(true);
      var posts = await ApiService.fetchPost();
      if(posts != null){
        postList.assignAll(posts);
      }
    } finally{

      isLoading(false);
    }

  }
}