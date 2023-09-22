import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/bloc/app_bloc.dart';
import 'package:health_care/view/blog_list.dart';

import 'bloc/app_event.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Health Care',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) {
          final blogBloc = BlogBloc();
          blogBloc.add(FetchBlogEvent()); // Dispatch the event here
          return blogBloc;
        },
        child: const HomePage(),
      ),
    ),
  );
}
