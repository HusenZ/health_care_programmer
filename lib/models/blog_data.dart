class Blog {
  final String imageUrl;
  final String title;
  final String body;
  const Blog({
    required this.imageUrl,
    required this.title,
    required this.body,
  });
}

enum PageType { home, blog, other }
