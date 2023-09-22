import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/bloc/app_event.dart';
import 'package:health_care/widgets/display_blog.dart';

import '../bloc/app_bloc.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blogBloc = BlocProvider.of<BlogBloc>(context);
    final blog = blogBloc.selectedBlog;
    if (blog == null) {
      // Handle the case where no blog is selected
      return Scaffold(
        appBar: AppBar(
          title: const Text("No Blog Selected"),
        ),
        body: const Center(
          child: Text("Please select a blog from the list."),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(blog.title),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<BlogBloc>(context).add(NavigateBack(blog));
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the blog image
              Hero(
                tag: 'imageTag',
                child: CachedNetworkImage(
                  imageUrl: blog.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 220,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Display the blog content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: displayBlog(blog.body),
              ),
            ],
          ),
        ),
      );
    }
  }
}
