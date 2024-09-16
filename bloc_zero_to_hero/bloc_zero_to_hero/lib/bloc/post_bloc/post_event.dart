part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends PostEvent{}

class SearchEvent extends PostEvent{
  final String stSearch;
  const SearchEvent(this.stSearch);
}