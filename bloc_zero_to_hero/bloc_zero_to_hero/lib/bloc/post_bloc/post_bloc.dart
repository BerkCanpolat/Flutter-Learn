import 'package:bloc/bloc.dart';
import 'package:bloc_zero_to_hero/models/post_model/post_model.dart';
import 'package:bloc_zero_to_hero/repository/post_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> tempPostList = [];

  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<FetchDataEvent>(_fetchDataMethod);
    on<SearchEvent>(_searchMethod);
  }

  void _fetchDataMethod(FetchDataEvent event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(postList: value, postEnum: PostEnum.success, message: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(postEnum: PostEnum.fail, message: error.toString()));
    },);
  }

  void _searchMethod(SearchEvent event, Emitter<PostState> emit) {
    if(event.stSearch.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {
      tempPostList = state.postList.where((e) => e.email.toString().toLowerCase().toString().contains(event.stSearch.toString().toLowerCase())).toList();
      if(tempPostList.isEmpty) {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: 'No Data Found Bloc'));
      } else {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
      }
    }
  }
}
