import 'package:flutter/material.dart';
import 'package:work121/pages/fetch.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;
  
  const ImagePage({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        file.url,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}