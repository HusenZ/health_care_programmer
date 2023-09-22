import 'package:equatable/equatable.dart';
import 'package:health_care/models/blog_data.dart';

abstract class BlogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchBlogEvent extends BlogEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToBlogEvent extends BlogEvent {
  final Blog blog;

  @override
  List<Object?> get props => [blog];

  NavigateToBlogEvent(this.blog);
}

class NavigateBack extends BlogEvent {
  final Blog blogs;
  @override
  List<Object?> get props => [];
  NavigateBack(this.blogs);
}

class ChangePageEvent extends BlogEvent {
  final PageType pageType;

  ChangePageEvent(this.pageType);

  @override
  List<Object?> get props => [pageType];
}
