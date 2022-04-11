part of 'search_image_bloc.dart';

abstract class SearchImageState extends Equatable {
  const SearchImageState();

  @override
  List<Object> get props => [];
}

class SearchImageInitialState extends SearchImageState {}

class SearchImageLoadingState extends SearchImageState {}

class SearchImageCompleteState extends SearchImageState {
  final SearchResult result;
  SearchImageCompleteState({required this.result});

  @override
  List<Object> get props => [result];
}

class SearchImageErroreState extends SearchImageState {
  final AppError appError;
  SearchImageErroreState({required this.appError});

  @override
  List<Object> get props => [appError];
}
