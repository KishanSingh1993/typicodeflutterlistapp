

import 'dart:convert';

import 'package:typicode_listapp/model/post.dart';
import 'package:http/http.dart' as http;

class ApiService{

  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Post>> fetchPost() async{

    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){

      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();

    }
    else{
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Post>> fetchPostDetails(int id) async{

    final response = await http.get(Uri.parse('$url/$id'));
    if(response.statusCode == 200){

      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();

    }
    else{
      throw Exception('Failed to load post');
    }
  }

}