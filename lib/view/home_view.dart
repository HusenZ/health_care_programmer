import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:health_care/bloc/app_bloc.dart';
import 'package:health_care/bloc/app_state.dart';
import 'package:health_care/view/blog_page.dart';
import 'package:health_care/widgets/display_horizontalList.dart';

import '../bloc/app_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is InitialBlogState) {
          return const CircularProgressIndicator();
        } else if (state is BlogScreenState) {
          return const BlogScreen();
        } else if (state is LoadedBlogState || state is ExitBlogScreenState) {
          final blogs = state.blogs;

          return Scaffold(
            appBar: AppBar(
              title: const Text('Health Care'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Articles',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  width: 500,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      final blog = blogs[index];

                      return InkWell(
                        onTap: () {
                          // Handle blog item click here
                          BlocProvider.of<BlogBloc>(context)
                              .add(NavigateToBlogEvent(blog));
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          margin: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Hero(
                                tag: 'imageTag',
                                child: CachedNetworkImage(
                                  imageUrl: blog.imageUrl,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: 120,
                                    width: 150,
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
                              const SizedBox(height: 8),
                              Positioned(
                                bottom: 12,
                                left: 5,
                                child: Text(
                                  blog.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                const DisplayHorizontalList(),
              ],
            ),
          );
        } else {
          return const Text('Error loading blogs');
        }
      },
    );
  }
}
