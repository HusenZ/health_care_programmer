import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/bloc/app_event.dart';
import 'package:health_care/bloc/app_state.dart';
import 'package:health_care/models/blog/list_blogs.dart';
import 'package:health_care/models/blog_data.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  Blog? _selectedBlog;

  Blog? get selectedBlog => _selectedBlog;

  BlogBloc() : super(InitialBlogState()) {
    on<FetchBlogEvent>(_fetchBlog);
    on<NavigateToBlogEvent>(_navigateToBlog);
    on<NavigateBack>(_navigateBack);
    on<ChangePageEvent>(
      (event, emit) => emit(ChangePageState(event.pageType)),
    );
  }

  void _fetchBlog(FetchBlogEvent event, Emitter<BlogState> emit) {
    try {
      emit(LoadedBlogState(blogsList));
    } catch (e) {
      emit(ErrorBlogState('Failed to load blogs: $e'));
    }
  }

  FutureOr<void> _navigateToBlog(
      NavigateToBlogEvent event, Emitter<BlogState> emit) {
    _selectedBlog = event.blog;
    emit(BlogScreenState(_selectedBlog!));
  }

  FutureOr<void> _navigateBack(NavigateBack event, Emitter<BlogState> emit) {
    emit(LoadedBlogState(blogsList));
  }
}
