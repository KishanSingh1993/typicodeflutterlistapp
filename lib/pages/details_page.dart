

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class DetailsPage extends StatelessWidget{
   final Post post;

   DetailsPage({required this.post});

  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(

       title: Text(post.title),
     ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Text(post.body),
     ),
   );
  }




}