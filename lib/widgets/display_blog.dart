//widget that will display the blog content
import 'package:flutter/material.dart';

Widget displayBlog(String content) {
  return SingleChildScrollView(
    child: RichText(
      text: TextSpan(
        text: content,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      softWrap: true,
    ),
  );
}
