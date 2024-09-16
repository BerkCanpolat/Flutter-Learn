part of 'post_bloc.dart';

enum PostEnum { loading, success, fail }

class PostState extends Equatable {
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final PostEnum postEnum;
  final String message;
  final String searchMessage;

  const PostState({
    this.postList = const [],
    this.tempPostList = const [],
    this.postEnum = PostEnum.loading,
    this.message = '',
    this.searchMessage = '',
  });

  PostState copyWith({
    List<PostModel>? postList,
    List<PostModel>? tempPostList,
    PostEnum? postEnum,
    String? message,
    String? searchMessage
  }){
    return PostState(
      postList: postList ?? this.postList,
      tempPostList: tempPostList ?? this.tempPostList,
      postEnum: postEnum ?? this.postEnum,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage
    );
  }

  @override
  List<Object> get props => [postList,tempPostList,postEnum,message,searchMessage];
}