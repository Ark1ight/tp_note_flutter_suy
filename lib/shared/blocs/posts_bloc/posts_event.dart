part of 'posts_bloc.dart';

sealed class PostsEvent{
  const PostsEvent();
}

class GetAllPosts extends PostsEvent{
  final String filter;

  const GetAllPosts(this.filter);
}