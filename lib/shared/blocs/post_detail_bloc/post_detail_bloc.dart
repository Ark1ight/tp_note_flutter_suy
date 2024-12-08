import 'package:flutter/cupertino.dart';

import '../../../app_exception.dart';
import '../../../models/post.dart';
import '../../services/posts_repository/posts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_detail_state.dart';
part 'post_detail_event.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostsRepository postsRepository;

  PostDetailBloc({required this.postsRepository}) : super(const PostDetailState()) {
    on<AddPost>((event, emit) async {
      emit(state.copyWith(status: PostDetailStatus.loading));

      try {
        await postsRepository.addPost(event.post);
        emit(state.copyWith(status: PostDetailStatus.success));
      } catch (error) {
        final appException = AppException.from(error);
        emit(state.copyWith(status: PostDetailStatus.error, exception: appException));
      }
    });
  }

}