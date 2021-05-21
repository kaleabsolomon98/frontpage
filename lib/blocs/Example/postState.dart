import 'package:equatable/equatable.dart';
import 'package:project4/models/QuoteModel.dart';

import 'Post.dart';


abstract class PostState extends Equatable {
  PostState([List props = const []]) ;
}

class PostUninitialized extends PostState {
  @override
  String toString() => 'PostUninitialized';

  @override
  List<Object> get props => [];

}

class PostError extends PostState {
  @override
  String toString() => 'PostError';

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PostLoaded extends PostState {
  final List<QuoteModel> posts;
  final bool hasReachedMax;

  PostLoaded({
    this.posts,
    this.hasReachedMax,
  }) : super([posts, hasReachedMax]);

  PostLoaded copyWith({
    List<QuoteModel> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';

  @override
  // TODO: implement props
  List<Object> get props => [posts,hasReachedMax];
}

class ItemsStateRefreshing extends PostState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}