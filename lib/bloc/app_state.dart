import 'package:equatable/equatable.dart';
import 'package:health_care/models/blog_data.dart';

abstract class BlogState extends Equatable {
  @override
  List<Object?> get props => [];

  get blogs => null;
}

class InitialBlogState extends BlogState {}

class LoadedBlogState extends BlogState {
  final List<Blog> blogs;

  LoadedBlogState(this.blogs);

  @override
  List<Object?> get props => [blogs];
}

class ErrorBlogState extends BlogState {
  final String errorMessage;

  ErrorBlogState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class BlogScreenState extends BlogState {
  final Blog blog;

  @override
  List<Object?> get props => [blog];

  BlogScreenState(this.blog);
}

class ExitBlogScreenState extends BlogState {
  @override
  final List<Blog> blogs;

  ExitBlogScreenState(this.blogs);

  @override
  List<Object?> get props => [blogs];
}

class ChangePageState extends BlogState {
  final PageType pageType;

  ChangePageState(this.pageType);

  @override
  List<Object?> get props => [pageType];
}
